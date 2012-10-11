<?php
/**
 * Tag Extraction Class
 * Copyright (c) 2005-2010, http://www.interpid.eu
 *
 * Tag Extraction Class is licensed under the terms of the GNU Open Source GPL 3.0
 * license.
 *
 * Commercial use is prohibited. Visit <http://www.interpid.eu/fpdf-components>
 * if you need to obtain a commercial license.
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/gpl.html>.
 *
 * 
 * Version:         1.1
 * Date:            2005/12/08
 * Author:          Bintintan Andrei <andy@interpid.eu>
 */

/**
 * Extracts the tags and corresponding text from a string
 * 
 * @name 	string_tags
 * @author 	Bintintan Andrei <andy@interpid.eu>
 * @version 1.1
 */
class string_tags{

/**
 * Contains the Tag/String Correspondence
 *
 * @access 	protected
 * @var		struct(array)
 */
protected $aTAGS = array();

/**
 * Contains the links for the tags that have specified this parameter
 * 
 * @access 	protected
 * @var		struct(array)
 */
protected $aHREF;

/**
 * The maximum number of chars for a tag
 *
 * @access 	protected
 * @var		integer
 */
protected $iTagMaxElem;
	
	/**
	 * Constructor
	 *
	 * @access 	public
	 * @param	numeric $p_tagmax - the number of characters allowed in a tag
	 * @return	void
	 */
	public function __construct($p_tagmax = 10){
		$this->aTAGS = array();
		$this->aHREF = array();
		$this->iTagMaxElem = $p_tagmax;
	}

	/**
	 * Returns TRUE if the specified tag name is an "<open tag>", (it is not already opened)
	 *
	 * @access 	protected
	 * @param	string $p_tag - tag name
	 * @param	array $p_array - tag arrays
	 * @return	boolean
	 */
    protected function OpenTag($p_tag, $p_array){

        $aTAGS = & $this->aTAGS;
        $aHREF = & $this->aHREF;
        $maxElem = & $this->iTagMaxElem;
      
        if (!preg_match("/^<([a-zA-Z0-9]{1,$maxElem}) *(.*)>$/i", $p_tag, $reg)) return false;

        $p_tag = $reg[1];

        $sHREF = array();
        if (isset($reg[2])) {
            preg_match_all("|([^ ]*)=[\"'](.*)[\"']|U", $reg[2], $out, PREG_PATTERN_ORDER);
            for ($i=0; $i<count($out[0]); $i++){
                $out[2][$i] = preg_replace("/(\"|')/i", "", $out[2][$i]);
                array_push($sHREF, array($out[1][$i], $out[2][$i]));
            }           
        }

        if (in_array($p_tag, $aTAGS)) return false;//tag already opened

        if (in_array("</$p_tag>", $p_array)) {
        	array_push($aTAGS, $p_tag);
        	array_push($aHREF, $sHREF);
            return true;
        }
        return false;
    }//OpenTag

	/** returnes true if $p_tag is a "<close tag>"
		@param 	$p_tag - tag string
                $p_array - tag array;
        @return true/false
	*/
	/**
	 * Returns true if $p_tag is a "<close tag>"
	 *
	 * @access 	protected
	 * @param	sting $p_tag - tag name
	 * @param	array $p_array - tag array
	 * @return	boolean
	 */
	protected function CloseTag($p_tag, $p_array){

	    $aTAGS = & $this->aTAGS;
	    $aHREF = & $this->aHREF;
	    $maxElem = & $this->iTagMaxElem;

	    if (!preg_match("/^<\/([a-zA-Z0-9]{1,$maxElem})>$/i", $p_tag, $reg)) return false;

	    $p_tag = $reg[1];

	    if (in_array("$p_tag", $aTAGS)) {
	    	array_pop($aTAGS);
	    	array_pop($aHREF);
	    	return true;
		}
	    return false;
	}// CloseTag
    
    /**
    * Expands the paramteres that are kept in Href field
    * 
    * @access 	protected
    * @param        array of parameters
    * @return       string with concatenated results
    */
    
    /**
     * Expands the paramteres that are kept in Href field
     *
     * @access 	protected
     * @param	struct $pResult
     * @return	string
     */
    protected function expand_parameters($pResult){
        $aTmp = $pResult['params'];
        if ($aTmp <> '')
            for ($i=0; $i<count($aTmp); $i++){
                $pResult[$aTmp[$i][0]] = $aTmp[$i][1];
            }
            
        unset($pResult['params']);
        
        return $pResult;
    }//expand_parameters
    
    
	/**
	 * Optimizes the result of the tag result array
	 * In the result array there can be strings that are consecutive and have the same tag, they
	 * are concatenated.
	 *
	 * @access 	protected
	 * @param	array $result - the array that has to be optimized
	 * @return	array - optimized result
	 */
	protected function optimize_tags($result){

		if (count($result) == 0) return $result;

		$res_result = array();
    	$current = $result[0];
    	$i = 1;

    	while ($i < count($result)){

    		//if they have the same tag then we concatenate them
			if (($current['tag'] == $result[$i]['tag']) && ($current['params'] == $result[$i]['params'])){
				$current['text'] .= $result[$i]['text'];
			}else{
                $current = $this->expand_parameters($current);
				array_push($res_result, $current);
				$current = $result[$i];
			}

			$i++;
    	}

        $current = $this->expand_parameters($current);
    	array_push($res_result, $current);
        
    	return $res_result;
    }//optimize_tags

    
    
   	/** Parses a string and returnes the result
		@param 	$p_str - string
        @return array (
        			array (string1, tag1),
        			array (string2, tag2)
        		)
	*/
   	/**
   	 * Parses a string and returnes an array of TAG - SRTING correspondent array
   	 * The result has the following structure:
   	 * 		array(
   	 * 			array (string1, tag1),
   	 * 			array (string2, tag2),
   	 * 			... etc
   	 * 		)
   	 * 
   	 * @access 	public
   	 * @param	string $p_str - the Input String
   	 * @return	array - the result array
   	 */
	public function get_tags($p_str){

	    $aTAGS = & $this->aTAGS;
	    $aHREF = & $this->aHREF;
	    $aTAGS = array();
	    $result = array();

		$reg = preg_split('/(<.*>)/U', $p_str, -1, PREG_SPLIT_DELIM_CAPTURE);

	    $sTAG = "";
	    $sHREF = "";

        while (list($key, $val) = each($reg)) {
	    	if ($val == "") continue;

	        if ($this->OpenTag($val,$reg)){
	            $sTAG = (($temp = end($aTAGS)) != NULL) ? $temp : "";
	            $sHREF = (($temp = end($aHREF)) != NULL) ? $temp : "";
	        }elseif($this->CloseTag($val, $reg)){
	            $sTAG = (($temp = end($aTAGS)) != NULL) ? $temp : "";
	            $sHREF = (($temp = end($aHREF)) != NULL) ? $temp : "";
	        }else {
	        	if ($val != "")
	        		array_push($result, array('text'=>$val, 'tag'=>$sTAG, 'params'=>$sHREF));
	        }
	    }//while

	    return $this->optimize_tags($result);
	}//get_tags

}//class string_tags

?>