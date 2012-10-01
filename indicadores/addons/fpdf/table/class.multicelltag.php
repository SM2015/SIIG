<?php
/**
 * FPDF Tag Based Multicell - FPDF class extension
 * Copyright (c) 2005-2010, http://www.interpid.eu
 *
 * FPDF Tag Based Multicell is licensed under the terms of the GNU Open Source GPL 3.0
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
 * Version:             1.4.2
 * Date:                2005/12/08
 * Last Modification:   2008/02/24
 * Author:              Bintintan Andrei <andy@interpid.eu>

 
/**
Modifications:
2007.01.21 
	- added left, top, right and bottom padding to the MultiCellTag Functions
2006.09.18  
    - added YPOS parameter to the tab for super/subscript posibility. ypos = '-1' means the relative position to the normal Y. 
2006.07.30  
    - added Paragraph Support(a sort of) - paragraphs can be specified with size='integer value' and PARAGRAPH_STRING character
2006.05.18
    - removed the NBLines functions
    - added mt_StringToLines function
    - modified  MultiCellTag to accept as data parameter an array type like the return from  mt_StringToLines function
    - these modifications does not affect the main class behavior, they are used for further developement and class extensions
*/

require_once(dirname(__FILE__).'/class.fpdf.php');
require_once(dirname(__FILE__).'/class.string_tags.php');

if (!defined('PARAGRAPH_STRING')) define('PARAGRAPH_STRING', '~~~');

/**
 * MultiCellTag Class
 * The intern functions are prefaced with mt_, not be be overwritten
 * 
 * @author 	andy@interpid.eu
 * @version 1.4
 * 
 */
class fpdf_multicelltag extends FPDF{

/**
 * Valid Tag Maximum Width
 *
 * @access 	protected
 * @var		integer
 */
protected $wt_TagWidthMax = 10;
	
/**
 * The current active tag
 *
 * @access	protected
 * @var		string
 */
protected $wt_Current_Tag = '';

/**
 * Tags Font Information 
 *
 * @access 	protected
 * @var		struct
 */
protected $wt_FontInfo;

/**
 * Parsed string data info
 *
 * @access 	protected
 * @var		struct
 */
protected $wt_DataInfo;

/**
 * Data Extra Info 
 *
 * @access 	protected
 * @var		struct
 */
protected $wt_DataExtraInfo;

/**
 * Temporary Info
 *
 * @access 	protected
 * @var		struct
 */
protected $wt_TempData;


/**
 * Sets the Tags Maximum width
 * 
 * @access 	public
 * @param 	numeric $iWidth - the width of the tags
 * @return 	void
 */
public function setTagWidthMax($iWidth = 10){
	$this->wt_TagWidthMax = $iWidth;
}


/**
 * Resets the current class internal variables to default values
 * 
 * @access 	protected
 * @param 	none
 * @return 	void
 */
protected function mt_Reset_Datas(){
		$this->wt_Current_Tag = "";
		$this->wt_DataInfo = array();
		$this->wt_DataExtraInfo = array(
			"LAST_LINE_BR" => "",		//CURRENT LINE BREAK TYPE
			"CURRENT_LINE_BR" => "",	//LAST LINE BREAK TYPE
			"TAB_WIDTH" => 10			//The tab WIDTH IS IN mm
		);

		//if another measure unit is used ... calculate your OWN
		$this->wt_DataExtraInfo["TAB_WIDTH"] *= (72/25.4) / $this->k;
		/*
			$this->wt_FontInfo - do not reset, once read ... is OK!!!
		*/
	}//function mt_Reset_Datas(){
	
	/**
	 * Sets current tag to specified style
	 *
	 * @access 	public
	 * @param 	string $tag - tag name
	 * @param	string $family - text font family name
	 * @param	string $style - text font style
	 * @param	numeric $size - text font size
	 * @param	array $color - text color
	 * @return	void
	 */
	public function SetStyle($tag, $family, $style, $size, $color)
	{

		if ($tag == "ttags") $this->Error (">> ttags << is reserved TAG Name.");
		if ($tag == "") $this->Error ("Empty TAG Name.");

		//use case insensitive tags
		$tag=trim(strtoupper($tag));
		$this->TagStyle[$tag]['family']=trim($family);
		$this->TagStyle[$tag]['style']=trim($style);
		$this->TagStyle[$tag]['size']=trim($size);
		$this->TagStyle[$tag]['color']=trim($color);
	}//function SetStyle
	
	/**
	 * Sets current tag to specified style
	 * 		- if the tag name is not in the tag list then de "DEFAULT" tag is saved.
	 * 		This includes a fist call of the function mt_SaveCurrentStyle()
	 *
	 * @access 	protected
	 * @param 	string $tag - tag name
	 * @return	void
	 */
	protected function mt_ApplyStyle($tag){

		//use case insensitive tags
		$tag=trim(strtoupper($tag));

		if ($this->wt_Current_Tag == $tag) return;

		if (($tag == "") || (! isset($this->TagStyle[$tag]))) $tag = "DEFAULT";

		$this->wt_Current_Tag = $tag;

		$style = & $this->TagStyle[$tag];

		if (isset($style)){
            $this->SetFont($style['family'], $style['style'], $style['size']);
            //this is textcolor in FPDF format
            if (isset($style['textcolor_fpdf'])) {
            	$this->TextColor = $style['textcolor_fpdf'];
            	$this->ColorFlag=($this->FillColor!=$this->TextColor);
			}else
            {
	            if ($style['color'] <> ""){//if we have a specified color
	            	$temp = explode(",", $style['color']);
					$this->SetTextColor($temp[0], $temp[1], $temp[2]);
				}//fi
			}
			/**/
		}//isset
	}//function mt_ApplyStyle($tag){

	/**
	 * Save the current settings as a tag default style under the DEFAUTLT tag name
	 * 
	 * @access 	protected
	 * @param 	none
	 * @return 	void
	 */
	protected function mt_SaveCurrentStyle(){
		$this->TagStyle['DEFAULT']['family'] = $this->FontFamily;;
		$this->TagStyle['DEFAULT']['style'] = $this->FontStyle;
		$this->TagStyle['DEFAULT']['size'] = $this->FontSizePt;
		$this->TagStyle['DEFAULT']['textcolor_fpdf'] = $this->TextColor;
		$this->TagStyle['DEFAULT']['color'] = "";
	}//function mt_SaveCurrentStyle

	
	/**
	 * Divides $this->wt_DataInfo and returnes a line from this variable
	 *
	 * @access 	protected
	 * @param	numeric $w - the width of the text
	 * @return 	array $aLine - array() -> contains informations to draw a line
	 */
	protected function mt_MakeLine($w){

		$aDataInfo = & $this->wt_DataInfo;
		$aExtraInfo = & $this->wt_DataExtraInfo;

		//last line break >> current line break
		$aExtraInfo['LAST_LINE_BR'] = $aExtraInfo['CURRENT_LINE_BR'];
		$aExtraInfo['CURRENT_LINE_BR'] = "";

	    if($w==0)
	        $w=$this->w - $this->rMargin - $this->x;

		$wmax = ($w - 2*$this->cMargin) * 1000;//max width

		$aLine = array();//this will contain the result
		$return_result = false;//if break and return result
		$reset_spaces = false;

		$line_width = 0;//line string width
		$total_chars = 0;//total characters included in the result string
		$space_count = 0;//numer of spaces in the result string
		$fw = & $this->wt_FontInfo;//font info array

		$last_sepch = ""; //last separator character
        
		foreach ($aDataInfo as $key => $val){
            
			$s = $val['text'];

			$tag = &$val['tag'];

            $bParagraph = false;            
            if (($s == "\t") && ($tag == 'pparg')){
                $bParagraph = true;
                $s = "\t";//place instead a TAB
            }

 			$s_lenght=strlen($s);

            $i = 0;//from where is the string remain
            $j = 0;//untill where is the string good to copy -- leave this == 1->> copy at least one character!!!
            $str = "";
            $s_width = 0;	//string width
            $last_sep = -1; //last separator position
            $last_sepwidth = 0;
            $last_sepch_width = 0;
            $ante_last_sep = -1; //ante last separator position
            $spaces = 0;
            
            //parse the whole string
	        while ($i < $s_lenght){
	        	$c = $s[$i];

   	        	if($c == "\n"){//Explicit line break
   	        		$i++; //ignore/skip this caracter
	        		$aExtraInfo['CURRENT_LINE_BR'] = "BREAK";
	        		$return_result = true;
	        		$reset_spaces = true;
	        		break;
	        	}

				//space
   	        	if($c == " "){
					$space_count++;//increase the number of spaces
					$spaces ++;
	        	}

	        	//	Font Width / Size Array
	        	if (!isset($fw[$tag]) || ($tag == "")){
	        		//if this font was not used untill now,
	        		$this->mt_ApplyStyle($tag);
	        		$fw[$tag]['w'] = $this->CurrentFont['cw'];//width
	        		$fw[$tag]['s'] = $this->FontSize;//size
	        	}

                $char_width = $fw[$tag]['w'][$c] * $fw[$tag]['s'];

	        	//separators
	        	if(is_int(strpos(" ,.:;",$c))){

	        		$ante_last_sep = $last_sep;
	        		$ante_last_sepch = $last_sepch;
	        		$ante_last_sepwidth = $last_sepwidth;
	        		$ante_last_sepch_width = $last_sepch_width;

	        		$last_sep = $i;//last separator position
	        		$last_sepch = $c;//last separator char
	        		$last_sepch_width = $char_width;//last separator char
	        		$last_sepwidth = $s_width;

	        	}

	        	if ($c == "\t"){//TAB
	        		$c = $s[$i] = "";
                    $char_width = $aExtraInfo['TAB_WIDTH'] * 1000;
	        	}

                if ($bParagraph == true){
                    $c = $s[$i] = "";
                    $char_width = $this->wt_TempData['LAST_TAB_REQSIZE']*1000 - $this->wt_TempData['LAST_TAB_SIZE'];
                    if ($char_width < 0) $char_width = 0;                
                }
                
                

	        	$line_width += $char_width;

				if($line_width > $wmax){//Automatic line break

					$aExtraInfo['CURRENT_LINE_BR'] = "AUTO";

					if ($total_chars == 0) {
						/* This MEANS that the $w (width) is lower than a char width...
							Put $i and $j to 1 ... otherwise infinite while*/
						$i = 1;
						$j = 1;
                        $return_result = true;//YES RETURN THE RESULT!!!
                        break;
					}//fi

					if ($last_sep <> -1){
						//we have a separator in this tag!!!
						//untill now there one separator
						if (($last_sepch == $c) && ($last_sepch != " ") && ($ante_last_sep <> -1)){
							/*	this is the last character and it is a separator, if it is a space the leave it...
                                Have to jump back to the last separator... even a space
							*/
							$last_sep = $ante_last_sep;
							$last_sepch = $ante_last_sepch;
							$last_sepwidth = $ante_last_sepwidth;
						}

						if ($last_sepch == " "){
							$j = $last_sep;//just ignore the last space (it is at end of line)
							$i = $last_sep + 1;
							if ( $spaces > 0 ) $spaces --;
							$s_width = $last_sepwidth;
						}else{
							$j = $last_sep + 1;
							$i = $last_sep + 1;
							$s_width = $last_sepwidth + $last_sepch_width;
						}

					}elseif(count($aLine) > 0){
						//we have elements in the last tag!!!!
						if ($last_sepch == " "){//the last tag ends with a space, have to remove it

							$temp = & $aLine[ count($aLine)-1 ];

							if ($temp['text'][strlen($temp['text'])-1] == " "){

								$temp['text'] = substr($temp['text'], 0, strlen($temp['text']) - 1);
								$temp['width'] -= $fw[ $temp['tag'] ]['w'][" "] * $fw[ $temp['tag'] ]['s'];
								$temp['spaces'] --;

								//imediat return from this function
								break 2;
							}else{
								#die("should not be!!!");
							}//fi
						}//fi
					}//fi else

	        		$return_result = true;
	        		break;
				}//fi - Auto line break

	        	//increase the string width ONLY when it is added!!!!
	        	$s_width += $char_width;

	        	$i++;
	        	$j = $i;
	        	$total_chars ++;
	        }//while

	        $str = substr($s, 0, $j);

	        $sTmpStr = & $aDataInfo[$key]['text'];
            $sTmpStr = substr($sTmpStr, $i, strlen($sTmpStr));

            if (($sTmpStr == "") || ($sTmpStr === FALSE))//empty
                array_shift($aDataInfo);

	        if ($val['text'] == $str){
	        }
            
            if (!isset($val['href'])) $val['href']='';
            if (!isset($val['ypos'])) $val['ypos']=0;

	        //we have a partial result
            array_push($aLine, array(
	        	'text' => $str,
	        	'tag' => $val['tag'],
	        	'href' => $val['href'],
	        	'width' => $s_width,
	        	'spaces' => $spaces,
                'ypos' => $val['ypos']
	        ));
            
            $this->wt_TempData['LAST_TAB_SIZE'] = $s_width;
            $this->wt_TempData['LAST_TAB_REQSIZE'] = (isset($val['size'])) ? $val['size'] : 0;           
            
	        if ($return_result) break;//break this for

		}//foreach

		// Check the first and last tag -> if first and last caracters are " " space remove them!!!"

		if ((count($aLine) > 0) && ($aExtraInfo['LAST_LINE_BR'] == "AUTO")){
			//first tag
			$temp = & $aLine[0];
			if ( (strlen($temp['text']) > 0) && ($temp['text'][0] == " ")){
				$temp['text'] = substr($temp['text'], 1, strlen($temp['text']));
				$temp['width'] -= $fw[ $temp['tag'] ]['w'][" "] * $fw[ $temp['tag'] ]['s'];
				$temp['spaces'] --;
			}

			//last tag
			$temp = & $aLine[count($aLine) - 1];
			if ( (strlen($temp['text'])>0) && ($temp['text'][strlen($temp['text'])-1] == " ")){
				$temp['text'] = substr($temp['text'], 0, strlen($temp['text']) - 1);
				$temp['width'] -= $fw[ $temp['tag'] ]['w'][" "] * $fw[ $temp['tag'] ]['s'];
				$temp['spaces'] --;
			}
		}

		if ($reset_spaces){//this is used in case of a "Explicit Line Break"
			//put all spaces to 0 so in case of "J" align there is no space extension
			for ($k=0; $k< count($aLine); $k++) $aLine[$k]['spaces'] = 0;
		}//fi

		return $aLine;
	}//function mt_MakeLine

	/**
		Draws a MultiCell with TAG recognition parameters
        @param		$w - with of the cell
        			$h - height of the cell
        			$pData - string or data to be printed
        			$border - border
        			$align	- align
        			$fill - fill
					$pad_left - pad left
					$pad_top - pad top
					$pad_right - pad right
					$pad_bottom - pad bottom
                    $pDataIsString - true if $pData is a string
                                   - false if $pData is an array containing lines formatted with $this->mt_MakeLine($w) function
                                        (the false option is used in relation with mt_StringToLines, to avoid double formatting of a string

        			These paramaters are the same and have the same behavior as at Multicell function
        @return     void
	*/
	/**
	 * Draws a MultiCell with TAG recognition parameters
	 *
	 * @param 	numeric $w - with of the cell
	 * @param	numeric $h - height of the lines in the cell
	 * @param 	string $pData - string or formatted data to be putted in the multicell
	 * @param	string or numeric $border
	 * 				Indicates if borders must be drawn around the cell block. The value can be either a number: 
	 * 						0 = no border
	 * 						1 = frame border
	 * 				or a string containing some or all of the following characters (in any order): 
	 * 						L: left
	 * 						T: top
	 * 						R: right
	 * 						B: bottom
	 * @param	string $align - Sets the text alignment
	 * 				Possible values:
	 * 						L: left
	 * 						R: right
	 * 						C: center
	 * 						J: justified
	 * @param	numeric $fill - Indicates if the cell background must be painted (1) or transparent (0). Default value: 0.
	 * @param 	numeric $pad_left - Left pad
	 * @param	numeric $pad_top - Top pad
	 * @param	numeric $pad_right - Right pad
	 * @param	numeric $pad_bottom - Bottom pad
	 * @param	boolean $pDataIsString
	 * 						- true if $pData is a string
	 *						- false if $pData is an array containing lines formatted with $this->mt_MakeLine($w) function
	 * 							(the false option is used in relation with mt_StringToLines, to avoid double formatting of a string
	 * @return 	void
	 */
	public function MultiCellTag($w, $h, $pData, $border=0, $align='J', $fill=0, $pad_left=0, $pad_top=0, $pad_right=0, $pad_bottom=0, $pDataIsString = true){

		//save the current style settings, this will be the default in case of no style is specified
		$this->mt_SaveCurrentStyle();
		$this->mt_Reset_Datas();
		
		$utf8_decoded_here = false;		
        
        //if data is string
        if ($pDataIsString === true)  {
        	
        	//IF UTF8 Support is needed then
        	if (isset($this->utf8_support) && isset($this->utf8_decoded)){
	            if (($this->utf8_support) && (!$this->utf8_decoded)) {
	                $pData = utf8_decode($pData);
	                $utf8_decoded_here = true;
	                $this->utf8_decoded = true;
	            }        		
        	}
        	$this->mt_DivideByTags($pData);
        }

		$b = $b1 = $b2 = $b3 = '';//borders
		
	    if($w==0)
	        $w = $this->w - $this->rMargin - $this->x;		
		
		/**
		 * If the vertical padding is bigger than the width then we ignore it
		 * In this case we put them to 0.
		 */
		if ( ($pad_left+$pad_right) > $w) {
			$pad_left = 0;
			$pad_right = 0;
		}
		
		$w_text = $w - $pad_left - $pad_right;

		//save the current X position, we will have to jump back!!!!
		$startX = $this -> GetX();

	    if($border)
	    {
	        if($border==1)
	        {
	            $border = 'LTRB';
	            $b1 = 'LRT';//without the bottom
	            $b2 = 'LR';//without the top and bottom
	            $b3 = 'LRB';//without the top
	        }
	        else
	        {
	            $b2='';
	            if(is_int(strpos($border,'L')))
	                $b2.='L';
	            if(is_int(strpos($border,'R')))
	                $b2.='R';
	            $b1=is_int(strpos($border,'T')) ? $b2 . 'T' : $b2;
	            $b3=is_int(strpos($border,'B')) ? $b2 . 'B' : $b2;
	        }

	        //used if there is only one line
	        $b = '';
	        $b .= is_int(strpos($border,'L')) ? 'L' : "";
	        $b .= is_int(strpos($border,'R')) ? 'R' : "";
	        $b .= is_int(strpos($border,'T')) ? 'T' : "";
	        $b .= is_int(strpos($border,'B')) ? 'B' : "";
	    }

	    $first_line = true;
        $last_line = false;
        
        if ($pDataIsString === true){
	        $last_line = !(count($this->wt_DataInfo) > 0);
        }else {
            $last_line = !(count($pData) > 0);
        }
                                                                      
		while(!$last_line){
			
			if ($first_line && ($pad_top > 0)){
				/**
				 * If this is the first line and there is top_padding
				 */
				$this->MultiCell($w, $pad_top, '', $b1, $align, 1);
				$b1 = str_replace('T', '', $b1);
				$b = str_replace('T', '', $b);
			}
			
			if ($fill == 1){
				//fill in the cell at this point and write after the text without filling
				$this->Cell($w,$h,"",0,0,"",1);
				$this->SetX($startX);//restore the X position
			}

            if ($pDataIsString === true){
			    //make a line
			    $str_data = $this->mt_MakeLine($w_text);
			    //check for last line
			    $last_line = !(count($this->wt_DataInfo) > 0);
            }else {
                //make a line
			    $str_data = array_shift($pData);
			    //check for last line
			    $last_line = !(count($pData) > 0);
            }

			if ($last_line && ($align == "J")){//do not Justify the Last Line
				$align = "L";
			}

			/**
			 * Restore the X position with the corresponding padding if it exist
			 * The Right padding is done automatically by calculating the width of the text
			 */
			$this->SetX( $startX + $pad_left );
			$this->mt_PrintLine($w_text, $h, $str_data, $align);


			//see what border we draw:
			if($first_line && $last_line){
				//we have only 1 line
				$real_brd = $b;
			}elseif($first_line){
				$real_brd = $b1;
			}elseif($last_line){
				$real_brd = $b3;
			}else{
				$real_brd = $b2;
			}
			
			if ($last_line && ($pad_bottom > 0)){
				/**
				 * If we have bottom padding then the border and the padding is outputted
				 */
				$this->SetX($startX);//restore the X
				$this->Cell($w,$h,"",$b2,2);
				$this->SetX($startX);//restore the X
				$this->MultiCell($w, $pad_bottom, '', $real_brd, $align, 1);
			}else{							
				//draw the border and jump to the next line
				$this->SetX($startX);//restore the X
				$this->Cell($w,$h,"",$real_brd,2);
			}
			

			if ($first_line) $first_line = false;								
		}//while(! $last_line){

		//APPLY THE DEFAULT STYLE
		$this->mt_ApplyStyle("DEFAULT");

		$this->x=$this->lMargin;
		
		//UTF8 Support
        if (isset($this->utf8_support) && isset($this->utf8_decoded)){
        	if (true == $utf8_decoded_here) $this->utf8_decoded = false;
        }		
		
	}//function MultiCellExt


	/**
		This method divides the string into the tags and puts the result into wt_DataInfo variable.
        @param		$pStr - string to be printed
        @return     void
	*/

	/**
	 * This method divides the string into the tags and puts the result into wt_DataInfo variable.
	 *
	 * @access 	protected
	 * @param 	string $pStr - string to be parsed
	 * @param	boolean $return - ==TRUE if the result is returned or not
	 * @return	struct or void
	 */
    protected function mt_DivideByTags($pStr, $return = false){

		$pStr = str_replace("\t", "<ttags>\t</ttags>", $pStr);
        $pStr = str_replace(PARAGRAPH_STRING, "<pparg>\t</pparg>", $pStr);
		$pStr = str_replace("\r", "", $pStr);

		//initialize the string_tags class
		$sWork = new string_tags(5);

		//get the string divisions by tags
        $this->wt_DataInfo = $sWork->get_tags($pStr);
               
        if ($return) return $this->wt_DataInfo;
    }//function mt_DivideByTags($pStr){
    
	/**
	 * This method parses the current text and return an array that contains the text information for
	 * each line that will be drawed.
	 *
	 * @access 	protected
	 * @param 	numeric $w - width of the line
	 * @param	string $pStr - String to be parsed
	 * @return 	array $aStrLines - contains parsed text information.
	 */
	protected function mt_StringToLines($w = 0, $pStr){

		//save the current style settings, this will be the default in case of no style is specified
		$this->mt_SaveCurrentStyle();
		$this->mt_Reset_Datas();
        
        $this->mt_DivideByTags($pStr);
             
	    $last_line = !(count($this->wt_DataInfo) > 0);
        
        $aStrLines = array();

		while (!$last_line){

			//make a line
			$str_data = $this->mt_MakeLine($w);
            array_push($aStrLines, $str_data);

			//check for last line
			$last_line = !(count($this->wt_DataInfo) > 0);
		}//while(! $last_line){

		//APPLY THE DEFAULT STYLE
		$this->mt_ApplyStyle("DEFAULT");

		return $aStrLines;
	}//function mt_StringToLines    

	
	/**
	 * Draws a Tag Based formatted line returned from mt_MakeLine function into the pdf document
	 *
	 * @access 	protected
	 * @param 	numeric $w - width of the text
	 * @param	numeric $h - height of a line
	 * @param 	string $aTxt - text to be draw
	 * @param	string $align - align of the text
	 * @return	void
	 */
	protected function mt_PrintLine($w, $h, $aTxt, $align='J'){

		if($w==0)
			$w=$this->w-$this->rMargin - $this->x;

		$wmax = $w; //Maximum width

		$total_width = 0;	//the total width of all strings
		$total_spaces = 0;	//the total number of spaces

		$nr = count($aTxt);//number of elements

		for ($i=0; $i<$nr; $i++){
            $total_width += ($aTxt[$i]['width']/1000);
            $total_spaces += $aTxt[$i]['spaces'];
		}

		//default
		$w_first = $this->cMargin;

		switch($align){
			case 'J':
				if ($total_spaces > 0)
					$extra_space = ($wmax - 2 * $this->cMargin - $total_width) / $total_spaces;
				else $extra_space = 0;
				break;
			case 'L':
				break;
			case 'C':
            	$w_first = ($wmax - $total_width) / 2;
				break;
			case 'R':
				$w_first = $wmax - $total_width - $this->cMargin;;
				break;
		}

		// Output the first Cell
		if ($w_first != 0){
			$this->Cell($w_first, $h, "", 0, 0, "L", 0);
		}

		$last_width = $wmax - $w_first;

        while (list($key, $val) = each($aTxt)) {
            
            $bYPosUsed = false;
                       
			//apply current tag style
			$this->mt_ApplyStyle($val['tag']);

			//If > 0 then we will move the current X Position
			$extra_X = 0;
            
            if ($val['ypos'] != 0){
                $lastY = $this->y;
                $this->y = $lastY - $val['ypos'];
                $bYPosUsed = true;
            }

			//string width
			$width = $this->GetStringWidth($val['text']);
			$width = $val['width'] / 1000;

			if ($width == 0) continue;// No width jump over!!!

			if($align=='J'){
				if ($val['spaces'] < 1) $temp_X = 0;
				else $temp_X = $extra_space;

				$this->ws = $temp_X;

				$this->_out(sprintf('%.3f Tw', $temp_X * $this->k));

				$extra_X = $extra_space * $val['spaces'];//increase the extra_X Space

			}else{
				$this->ws = 0;
				$this->_out('0 Tw');
			}//fi

			//Output the Text/Links
			$this->Cell($width, $h, $val['text'], 0, 0, "C", 0, $val['href']);

			$last_width -= $width;//last column width

			if ($extra_X != 0){
				$this -> SetX($this->GetX() + $extra_X);
				$last_width -= $extra_X;
			}//fi
            
            if ($bYPosUsed) $this->y = $lastY;
            
		}//while

		// Output the Last Cell
		if ($last_width != 0){
			$this->Cell($last_width, $h, "", 0, 0, "", 0);
		}//fi
	}//function mt_PrintLine
	
}//class

?>