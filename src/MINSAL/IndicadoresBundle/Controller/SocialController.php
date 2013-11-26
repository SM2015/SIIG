<?php

namespace MINSAL\IndicadoresBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;

use Symfony\Component\HttpFoundation\Response;
use MINSAL\IndicadoresBundle\Entity\ComentariosSala;
use MINSAL\IndicadoresBundle\Entity\GrupoIndicadores;
use MINSAL\IndicadoresBundle\Entity\User;
use MINSAL\IndicadoresBundle\Entity\UsuarioGrupoIndicadores;
use Symfony\Component\HttpFoundation\Session\Session;

class SocialController extends Controller {

    /**
     * @Route("/sala/get_comentarios/{idSala}/", name="sala_get_comentarios", options={"expose"=true})
     */
    public function getComentariosSala($idSala) {
        $session = new Session();
        $em = $this->getDoctrine()->getManager();
        $req = $this->getRequest();

        
        if ($req->get('vez') == 1 or $session->get('ultima_lectura_comentarios_sala') == ''){
            
            $comentarios = $em->getRepository('IndicadoresBundle:ComentariosSala')
                ->findBy(array('sala'=>$idSala), array('fecha'=>'ASC'))
                 ;            
        }
        else{
            $comentarios = $em->createQuery('SELECT c FROM IndicadoresBundle:ComentariosSala  c WHERE c.sala = :sala AND c.fecha > :fecha ORDER  BY c.fecha ASC')
                            ->setParameter('sala', $idSala)
                            ->setParameter('fecha', $session->get('ultima_lectura_comentarios_sala'))
                            ->getResult();
        }
        $session->set('ultima_lectura_comentarios_sala', new \DateTime("now"));
        
        $ret = '';
        foreach($comentarios as $comentario){
            $ret .= '<div class="mensaje-sala">
                <span class="chat-usuario">'.$comentario->getUsuario().'</span> <span class="pull-right chat-fecha"> '.$comentario->getFecha()->format('Y-m-d H:i:s').'</span><BR/> 
                    '.$comentario->getComentario().' </div>';
        }
        

        
        $response = new Response($ret);

        return $response;
    }
    
    /**
     * @Route("/sala/{id}/set_comentario", name="sala_set_comentario", options={"expose"=true})
     */
    public function setComentarioSala(GrupoIndicadores $sala) {
        $session = new Session();
        $em = $this->getDoctrine()->getManager();
        $req = $this->getRequest();
        $comentario = new ComentariosSala();
        $ahora = new \DateTime("now");
        
        $comentario->setComentario($req->get('chat-mensaje'));
        $comentario->setUsuario($this->getUser());
        $comentario->setFecha($ahora);
        $comentario->setSala($sala);
        
        $em->persist($comentario);
        $em->flush();
        $session->set('ultima_lectura_comentarios_sala', new \DateTime("now"));
        
        $ret = '<div class="mensaje-sala">
                <span class="chat-usuario">'.$comentario->getUsuario().'</span> <span class="pull-right chat-fecha"> '.$comentario->getFecha()->format('Y-m-d H:i:s').'</span><BR/> 
                    '.$comentario->getComentario().' </div>';
        $response = new Response($ret);

        return $response;
    }
    
    /**
     * @Route("/sala/get_usuarios/{idSala}/", name="sala_get_usuarios", options={"expose"=true})
     */
    public function getUsuariosSala($idSala) {
        $em = $this->getDoctrine()->getManager();
        
        $usuarios_asignados = $em->getRepository('IndicadoresBundle:UsuarioGrupoIndicadores')
                        ->findBy(array('grupoIndicadores' => $idSala));
        $usuarios_asignados_por_usuario_actual = $em->getRepository('IndicadoresBundle:UsuarioGrupoIndicadores')
                        ->findBy(array('usuarioAsigno'=>$this->getUser(),
                                        'grupoIndicadores' => $idSala));
        $usuarios_sala_por_usuario_actual = array(); 
        foreach ($usuarios_asignados_por_usuario_actual as $ua){
            $usuarios_sala_por_usuario_actual[] = $ua->getUsuario()->getId();
        }
        
        $usuarios_sala = array(); 
        foreach ($usuarios_asignados as $ua){
            $usuarios_sala[] = $ua->getUsuario()->getId();
        }
        
        $usuarios = $em->getRepository('IndicadoresBundle:User')
                        ->findBy(array(), array('username'=>'ASC'));
        
        $ret = '';
        foreach ($usuarios as $u){
            if ($u->getId() != $this->getUser()->getId()){
                $check = (in_array($u->getId(), $usuarios_sala)) ? 'checked': '';
                $disable = ($check=='checked' and !in_array($u->getId(), $usuarios_sala_por_usuario_actual)) ? 'disabled="disabled"': '';
                $ret .= '<INPUT class="usuariosSala" TYPE="checkbox" VALUE="'.$u->getId().'" NAME="usuariosSala[]" '.$check.' '.$disable.'/>'.$u->getUsername().'<BR>';
            }
        }
        
        $response = new Response($ret);

        return $response;
    }
    
    /**
     * @Route("/sala/{id}/set_usuario/{id_usuario}/{accion}", name="sala_set_usuario", options={"expose"=true})
     */
    public function setUsuarioSala(GrupoIndicadores $sala, $id_usuario, $accion) {
        $em = $this->getDoctrine()->getManager();
        if ($accion == 'borrar'){
            $usuarios_asignados = $em->getRepository('IndicadoresBundle:UsuarioGrupoIndicadores')
                        ->findOneBy(array('usuario'=>$id_usuario,
                                        'grupoIndicadores' => $sala));
            $em->remove($usuarios_asignados);
        } else{
            $usuario = $em->find('IndicadoresBundle:User', $id_usuario);
            $usuarioSala = new UsuarioGrupoIndicadores();
            $usuarioSala->setGrupoIndicadores($sala);
            $usuarioSala->setUsuario($usuario);
            $usuarioSala->setUsuarioAsigno($this->getUser());
            $em->persist($usuarioSala);
        }
        
        $em->flush();
        
        return new Response();
    }

}
