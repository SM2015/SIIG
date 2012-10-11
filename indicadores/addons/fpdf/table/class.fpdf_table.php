<?php
/**
 * FPDF Table - FPDF class extension
 * Copyright (c) 2005-2010, http://www.interpid.eu
 *
 * FPDF Table is licensed under the terms of the GNU Open Source GPL 3.0
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
  * Version:        3.4.3
 * Date:        2005/07/20
 * Author:        Bintintan Andrei <andy@interpid.eu>



/**
Modifications:
2007.03.03
	- added support for ROWSPAN
	- changed the class functions/variables for PHP5 
2006.09.25
    - corrected a bug for empty cell texts
    - corrected a bug for cell lines aligment error on new page
2006.05.18
    - added support for cell splitting if new page ocuurs. FPDF_TABLE::tbSetSplitMode(true/false)
    sets the splitting mode.
            true = normal mode, the cell is splitted where the split ocuurs.
            false = if splitting is required then the cell is drawed on the new page. If the cell
            Height is bigger then the page height then the cell will be splitted.
    - if the header does not have enough space for double it's Height then a new page ocuurs.
*/
require_once(dirname(__FILE__).'/class.multicelltag.php');

/**
 * FPDF_TABLE - FPDF TABLE Add On Class
 * @author 		Bintintan Andrei
 * @copyright 	2005 - 2007
 */
class fpdf_table extends fpdf_multicelltag 
{
	
/**
 * Number of Columns of the Table
 * @access 	protected
 * @var		int
 */
protected 	$iColumnsNr = 0;

/**
 *	Contains the Header Data - header characteristics and texts
 *	
 *	Characteristics constants for Header Type:
 *	EVERY CELL FROM THE TABLE IS A MULTICELL
 *
 *	WIDTH - this is the cell width. This value must be sent only to the HEADER!!!!!!!!
 *	T_COLOR - text color = array(r,g,b);
 *	T_SIZE - text size
 *	T_FONT - text font - font type = "Arial", "Times"
 *	T_ALIGN - text align - "RLCJ"
 *	V_ALIGN - text vertical alignment - "TMB"
 *	T_TYPE - text type (Bold Italic etc)
 *	LN_SPACE - space between lines
 *	BG_COLOR - background color = array(r,g,b);
 *	BRD_COLOR - border color = array(r,g,b);
 *	BRD_SIZE - border size --
 *	BRD_TYPE - border size -- up down, with border without!!! etc
 *	BRD_TYPE_NEW_PAGE - border type on new page - this is user only if specified(<>'')
 *	TEXT - header text -- THIS ALSO BELONGS ONLY TO THE HEADER!!!!
 *
 *	all these setting conform to the settings from the multicell functions!!!!	
 * 
 * @access 	protected
 * @var 	array
 */
protected 	$aTableHeaderType = array();

/**
 * Header is drawed or not
 * @access 	protected
 * @var		boolean
 */
protected	$bTableHeaderDraw = true;

/**
 * Table Border is drawed or not
 * @access 	protected
 * @var		boolean
 */
protected	$bTableBorderDraw = true;

/**
 * Table Data Characteristics 
 * @access 	protected
 * @var		array
 */
protected 	$aTableDataType = array();

/**
 * Table Characteristics 
 * @access 	protected
 * @var		array
 */
protected 	$aTableType = array();

/**
 * Page Split Variable - if the table does not have enough space on the current page then the cells will be splitted.
 * This onlu if $bTableSplit == TRUE
 * If $bTableSplit == FALSE then the current cell will be drawed on the next page
 *
 * @access 	protected
 * @var 	boolean
 */
protected	$bTableSplit = true;

/**
 * TRUE - if on current page was some data written
 * @access 	protected
 * @var		boolean
 */
protected	$bDataOnCurrentPage = false;

/**
 * Table Data Cache. Will contain the information about the rows of the table
 * @access 	protected
 * @var		array
 */
protected	$aDataCache = array();

/**
 * TRUE - if there is a Rowspan in the Data Cache
 * @access 	protected	
 * @var		boolean
 */
protected	$bRowSpanInCache = false;

/**
 * Sequence for Rowspan ID's. Every Rowspan gets a unique ID
 * @access 	protected
 * @var		int
 */
protected	$iRowSpanID = 0;

/**
 * Table Header Cache. Will contain the information about the header of the table
 * @access 	protected
 * @var		array
 */
protected	$aHeaderCache = array();

/**
 * Header Height. In user units!
 * @access 	protected
 * @var		int
 */
protected	$iHeaderHeight = 0;

/**
 * Table Start X Position
 * @access 	protected
 * @var		int
 */
protected	$iTableStartX = 0;

/**
 * Table Start Y Position
 * @access 	protected
 * @var		int
 */
protected	$iTableStartY = 0;

/**
 * CLASS FUNCTIONS 
 */

/**
 * Returns the current page Width
 *
 * @access 	protected
 * @param 	void
 * @return  integer - the Page Width
 */
protected function PageWidth(){
	return (int) $this->w - $this->rMargin - $this->lMargin;
}//function PageWidth


/**
 * Returns the current page Height
 *
 * @access 	protected
 * @param 	void
 * @return	integer - the Page Height
 */
protected function PageHeight(){
	return (int) $this->h - $this->tMargin - $this->bMargin;
}//function PageHeight



/**
 * CONSTRUCTOR
 * Table Initialization Function
 *
 * @access 	public
 * @param	integer	- $iColumnsNr - Number of Colums 
 * @param	boolean	- $bTableHeaderDraw	- true => Draw the table header on a new page
 * @param	boolean - $bTableBorderDraw - true => Draw the table border
 * @return 	null
 */
public function tbInitialize($iColumnsNr = 0, $bTableHeaderDraw = true, $bTableBorderDraw = true){

	$this->iColumnsNr = $iColumnsNr;
	$this->aTableHeaderType = Array();
	$this->bTableHeaderDraw = $bTableHeaderDraw;
	$this->aTableDataType = Array();
	
	$this->aDataCache = Array();
	$this->aHeaderCache = Array();
	
	$this->bTableBorderDraw = $bTableBorderDraw;
	$this->bTableHeaderDraw = $bTableHeaderDraw;
			
	$this->iTableStartX = $this->GetX();
	$this->iTableStartY = $this->GetY();

	$this->bDataOnCurrentPage = false;
}

/**
 * Sets the number of Columns in the Table
 *
 * @access 	public
 * @param	integer	$iNr	- the number of Columns
 * @return 	void
 */
public function tbSetColumnsNo($iNr){
	$this->iColumnsNr = $iNr;
}

/**
 * Sets the Split Mode of the Table. Default is ON(true)
 *
 * @access 	public
 * @param	boolean $bSplit - if TRUE then Split is Active
 * @return 	void
 */
public function tbSetSplitMode($bSplit = true){
	$this->bTableSplit = $bSplit;
}

/**
 * Sets the Header Type
 * 
 * $aHeaderType=
 *	 array(
 *		0=>array(
 *				"WIDTH" => 10,
 *				"T_COLOR" => array(120,120,120),
 *				"T_SIZE" => 5,
 *				...
 *				"TEXT" => "Header text 1"
 *			  ),
 *		1=>array(
 *				...
 *			  ),
 *	 );
 * 
 * 	where 0,1... are the column number
 * 
 * If the Header has multiple lines than $aHeaderType WILL HAVE TO Contain an array, which elements are composed from the array
 * desribed above.
 * 		$aHeaderType = array ($aHeaderType1, $aHeaderType2) where $aHeaderType1 and $aHeaderType2 have the above description
 *
 * @access 	public
 * @param	array	$type_arr - header type
 * @param	boolean $bMultiLines - the header has multiple lines or not
 * @return 	void
 */
public function tbSetHeaderType($aHeaderType, $bMultiLines = false){
	if ($bMultiLines == false)
		$this->aTableHeaderType[0] = $aHeaderType;
	else 
		$this->aTableHeaderType = $aHeaderType;
		
	//create the header cache data
	foreach ($this->aTableHeaderType as $val)
		$this->_tbAddDataToCache($val, 'header');	
		
	$this->_tbCacheParseRowspan(0, 'header');
		
	$this->tbHeaderHeight();
}


/**
 * Calculates the Header Height. 
 * If the Header height is bigger than the page height then the script dies. 
 * 
 * @access 	private
 * @param 	void
 * @return 	void
 */
private function tbHeaderHeight(){
	$this->iHeaderHeight = 0;
		
	$iItems = count($this->aHeaderCache);
	for ($i=0; $i< $iItems; $i++){
		$this->iHeaderHeight += $this->aHeaderCache[$i]['HEIGHT'];
	}
		
	if ($this->iHeaderHeight > $this->PageHeight()){
		die("Header Height({$this->iHeaderHeight}) bigger than Page Height({$this->PageHeight()})");
	}
}//private function tbHeaderHeight



/**
 * Calculates the X margin of the table depending on the ALIGN 
 *
 * @access 		protected
 * @param 		void
 * @return 		void
 */
protected function tbMarkMarginX(){
	
	
	if (isset($this->aTableType['TB_ALIGN'])){
		$tb_align = $this->aTableType['TB_ALIGN']; 
	}else{
		$tb_align='';
	}

	//set the table align
	switch($tb_align){
		case 'C':
			$this->iTableStartX = $this->lMargin + $this->aTableType['L_MARGIN'] + ($this->PageWidth() - $this->tbGetWidth())/2;
			break;
		case 'R':
			$this->iTableStartX = $this->lMargin + $this->aTableType['L_MARGIN'] + ($this->PageWidth() - $this->tbGetWidth());
			break;
		default:
			$this->iTableStartX = $this->lMargin + $this->aTableType['L_MARGIN'];
			break;
	}//
	
}//protected function tbMarkMarginX


/*
Characteristics constants for Data Type:
EVERY CELL FROM THE TABLE IS A MULTICELL
	T_COLOR - text color = array(r,g,b);
	T_SIZE - text size
	T_FONT - text font - font type = "Arial", "Times"
	T_ALIGN - text align - "RLCJ"
	V_ALIGN - text vertical alignment - "TMB"
	T_TYPE - text type (Bold Italic etc)
	LN_SPACE - space between lines
	BG_COLOR - background color = array(r,g,b);
	BRD_COLOR - border color = array(r,g,b);
	BRD_SIZE - border size --
	BRD_TYPE - border size -- up down, with border without!!! etc
	BRD_TYPE_NEW_PAGE - border type on new page - this is user only if specified(<>'')

	all these settings conform to the settings from the multicell functions!!!!
*/

/**
 * Sets the Data Type. This Data Type is used as the default type for datas in the entire table. Of corse the user can
 * specify for every cell some specific data types
 * $aDataType=
 *	 array(
 *		0=>array(
 *				"WIDTH" => 10,
 *				"T_COLOR" => array(120,120,120),
 *				"T_SIZE" => 5,
 *				...
 *				"TEXT" => "Header text 1"
 *			  ),
 *		1=>array(
 *				...
 *			  ),
 *	 );
 * 
 * 	where 0,1... are the column number
 * 
 * @access 	public
 * @param	array - $aDataType - Array Containing the Data Type
 * @return 	void
 */
public function tbSetDataType($aDataType){
	$this->aTableDataType = $aDataType;
}//function tbSetDataType


/**
 * Sets the Table Type
 * 
 * $aTableType = array(
 * 					"BRD_COLOR"=> array (120,120,120), //border color
 * 					"BRD_SIZE"=>5), //border line width
 * 					"iColumnsNr"=>5), //the number of columns
 * 					"TB_ALIGN"=>"L"), //the align of the table, possible values = L, R, C equivalent to Left, Right, Center
 * 					'L_MARGIN' => 0// left margin... reference from this->lmargin values
 * 					);
 * 
 * @access 	public
 * @param	array	$aTableType - array containing the Table Type
 * @return 	void
 */
public function tbSetTableType($aTableType){

	if (isset($aTableType['iColumnsNr'])) $this->iColumnsNr = $aTableType['iColumnsNr'];
	if (!isset($aTableType['L_MARGIN'])) $aTableType['L_MARGIN']=0;//default values

	$this->aTableType = $aTableType;
	$this->tbMarkMarginX();

}//function tbSetTableType


/**
 * Draws the Table Border
 * 
 * @access 	public
 * @param 	void
 * @return 	void
 */
public function tbDrawBorder(){

	if ( ! $this->bTableBorderDraw ) return;

	if ( ! $this->bDataOnCurrentPage) return; //there was no data on the current page

	//set the colors
	list($r, $g, $b) = $this->aTableType['BRD_COLOR'];
	$this->SetDrawColor($r, $g, $b);

	//set the line width
	$this->SetLineWidth($this->aTableType['BRD_SIZE']);
    
	//draw the border
	$this->Rect(
		$this->iTableStartX,
		$this->iTableStartY,
		$this->tbGetWidth(),
		$this->GetY() - $this->iTableStartY);

}//function tbDrawBorder


/**
 * End Page Special Border Draw. This is called in the case of a Page Split
 *
 * @access 	protected
 * @param 	void
 * @return 	void
 */
protected function _tbEndPageBorder(){
	if (isset($this->aTableType['BRD_TYPE_END_PAGE'])){

		if (strpos($this->aTableType['BRD_TYPE_END_PAGE'], 'B') >= 0){

			//set the colors
			list($r, $g, $b) = $this->aTableType['BRD_COLOR'];
			$this->SetDrawColor($r, $g, $b);

			//set the line width
			$this->SetLineWidth($this->aTableType['BRD_SIZE']);

			//draw the line
			$this->Line($this->table_startx, $this->GetY(), $this->table_startx + $this->tbGetWidth(), $this->GetY());
		}//fi
	}//fi
}//function _tbEndPageBorder

/**
 * Returns the table width in user units
 *
 * @access 	public
 * @param 	void
 * @return 	integer - table width
 */
public function tbGetWidth()
{
	//calculate the table width
	$tb_width = 0;
	
	for ($i=0; $i < $this->iColumnsNr; $i++){
		$tb_width += $this->aTableHeaderType[0][$i]['WIDTH'];
	}
	
	return $tb_width;
}//tbGetWidth


/**
 * Aligns the table to the Start X point
 *
 * @access 		protected
 * @param 		void
 * @return 		void
 * 
 */
protected function _tbAlign(){
	$this->SetX($this->iTableStartX);
}//function _tbAlign(){


/**
 * "Draws the Header". 
 * More specific puts the data from the Header Cache into the Data Cache
 * 
 * @access 	public
 * @param 	void
 * @return 	void
 */
public function tbDrawHeader(){
	
	foreach($this->aHeaderCache as $val){
		$this->aDataCache[] = $val;
	}
}//function tbDrawHeader


/**
 * Adds a line to the Table Data or Header Cache.
 * Call this function after the table initialization, table, header and data types are set
 * 
 * @access 	public
 * @param	array $data - Data to be Drawed
 * @param	booleab $header - Array Containing data is Header Data or Data Data
 * @return	null
 */
public function tbDrawData($data, $header = true){
	$this->_tbAddDataToCache($data);
}

/**
 * Adds the data to the cache
 *
 * @access	protected
 * @param	array	$data - array containing the data to be added
 * @param	string 	$sDataType - data type. Can be 'data' or 'header'. Depending on this data the $data is put in the selected cache
 * @return 	void
 */
protected function _tbAddDataToCache($data, $sDataType = 'data'){
	
	
	if (!is_array($data)) {
		//this is fatal error
		trigger_error("Invalid data value 0x00012. (not array)", E_USER_ERROR);
	}
	
	//IF UTF8 Support is needed then 
	if (isset($this->utf8_support) && ($this->utf8_support)){
		for($i=0; $i < $this->iColumnsNr; $i++){
			$data[$i]['TEXT'] = utf8_decode($data[$i]['TEXT']);
		}
		
		//keep the compatibility with the "old" fpdf utf8 support.
		if (isset($this->utf8_decoded)) $this->utf8_decoded = true;		
	}
		
	if ($sDataType == 'data')
		$aDataCache = & $this->aDataCache;
	elseif ($sDataType == 'header')
		$aDataCache = & $this->aHeaderCache;
		
	$aRowSpan = array();
	
	
	$hm = 0;
	$rowspan = false;
	
	/**
	 * If datacache is empty initialize it
	 */
	if (count($aDataCache) > 0) $aLastDataCache = end($aDataCache);
	else $aLastDataCache = array();
	
	//this variable will contain the active colspans
	$iActiveColspan = 0;
	
	//calculate the maximum height of the cells
	for($i=0; $i < $this->iColumnsNr; $i++){
		
        if (!isset($data[$i]['TEXT']) || ($data[$i]['TEXT']=='')) $data[$i]['TEXT'] = ' ';
		if (!isset($data[$i]['T_FONT'])) $data[$i]['T_FONT'] = $this->aTableDataType[$i]['T_FONT'];
		if (!isset($data[$i]['T_TYPE'])) $data[$i]['T_TYPE'] = $this->aTableDataType[$i]['T_TYPE'];
		if (!isset($data[$i]['T_SIZE'])) $data[$i]['T_SIZE'] = $this->aTableDataType[$i]['T_SIZE'];
		if (!isset($data[$i]['T_COLOR'])) $data[$i]['T_COLOR'] = $this->aTableDataType[$i]['T_COLOR'];
		if (!isset($data[$i]['T_ALIGN'])) $data[$i]['T_ALIGN'] = $this->aTableDataType[$i]['T_ALIGN'];
		if (!isset($data[$i]['V_ALIGN'])) $data[$i]['V_ALIGN'] = $this->aTableDataType[$i]['V_ALIGN'];
		if (!isset($data[$i]['LN_SIZE'])) $data[$i]['LN_SIZE'] = $this->aTableDataType[$i]['LN_SIZE'];
		if (!isset($data[$i]['BRD_SIZE'])) $data[$i]['BRD_SIZE'] = $this->aTableDataType[$i]['BRD_SIZE'];
		if (!isset($data[$i]['BRD_COLOR'])) $data[$i]['BRD_COLOR'] = $this->aTableDataType[$i]['BRD_COLOR'];
		if (!isset($data[$i]['BRD_TYPE'])) $data[$i]['BRD_TYPE'] = $this->aTableDataType[$i]['BRD_TYPE'];
		if (!isset($data[$i]['BG_COLOR'])) $data[$i]['BG_COLOR'] = $this->aTableDataType[$i]['BG_COLOR'];
		if (!isset($data[$i]['COLSPAN'])) $data[$i]['COLSPAN'] = 1; else $data[$i]['COLSPAN'] = (int) $data[$i]['COLSPAN'];
		if (!isset($data[$i]['ROWSPAN'])) $data[$i]['ROWSPAN'] = 1; else $data[$i]['ROWSPAN'] = (int) $data[$i]['ROWSPAN'];
		$data[$i]['HEIGHT'] = 0;	//default HEIGHT
		$data[$i]['SKIP'] = false;	//default SKIP (don't skip)
		$data[$i]['CELL_WIDTH'] = $this->aTableHeaderType[0][$i]['WIDTH'];	//copy this from the header settings
		$data[$i]['ROWSPAN_PRIMARY'] = FALSE;	//==true then this row has generated the rowspan
		$data[$i]['ROWSPAN_ID'] = 0;	//rowspan ID
		$data[$i]['HEIGHT'] = 0;	//default HEIGHT
				
		if ($data[$i]['LN_SIZE'] <= 0){
			trigger_error("Invalid Line Size {$data[$i]['LN_SIZE']}", E_USER_ERROR);
		}
		
		
		//if there is an active colspan on this line we just skip this cell
		if ($iActiveColspan > 1){
			$data[$i]['SKIP'] = true;
			//if ($i>0) $data[$i]['ROWSPAN'] = $data[$i-1]['ROWSPAN'];
			$iActiveColspan --;
			continue;
		}

		
		if (!empty($aLastDataCache)){
			
			//there was at least one row before
			
			if ( $aLastDataCache['DATA'][$i]['ROWSPAN'] > 1 ){
				/**
				 * This is rowspan over this cell. The cell will be ignored but some characteristics are kept
				 */
				
				//this cell will be skipped
				$data[$i]['SKIP'] =true;
				//decrease the rowspan value... one line less to be spanned
				$data[$i]['ROWSPAN'] = $aLastDataCache['DATA'][$i]['ROWSPAN'] - 1;
				$data[$i]['ROWSPAN_ID'] = $aLastDataCache['DATA'][$i]['ROWSPAN_ID'];
				$data[$i]['ROWSPAN_PRIMARY'] = false;
				//copy the colspan from the last value
				$data[$i]['COLSPAN'] = $aLastDataCache['DATA'][$i]['COLSPAN'];
				//cell with is the same as the one from the line before it
				$data[$i]['CELL_WIDTH'] = $aLastDataCache['DATA'][$i]['CELL_WIDTH'];
				
				if ($data[$i]['COLSPAN'] > 1){
					$iActiveColspan = $data[$i]['COLSPAN'];
				}
				
				continue; //jump to the next column
				
			}//if
			
		}//if
		
		
		//set the font settings
		$this->SetFont(	$data[$i]['T_FONT'],
						$data[$i]['T_TYPE'],
						$data[$i]['T_SIZE']);

		
		/**
		 * If we have colspan then we ignore the "colspanned" cells
		 */
		if ( $data[$i]['COLSPAN'] > 1 ){

			for ($j = 1; $j < $data[$i]['COLSPAN']; $j++){
				//if there is a colspan, then calculate the number of lines also with the with of the next cell
				if (($i + $j) < $this->iColumnsNr)
					$data[$i]['CELL_WIDTH'] += $this->aTableHeaderType[0][$i + $j]['WIDTH'];
			}//for
					
		}//if
		
		//add the cells that are with rowspan to the rowspan array - this is used later
		if ( $data[$i]['ROWSPAN'] > 1 ){
			$data[$i]['ROWSPAN_PRIMARY'] = true;
			$this->iRowSpanID++;
			$data[$i]['ROWSPAN_ID'] = $this->iRowSpanID;
			$aRowSpan[] = $i;
		}
       
		
        //$MaxLines = floor($AvailPageH / $data[$i]['LN_SIZE']);//floor this value, must be the lowest possible
        
        if (!isset($data[$i]['TEXT_STRLINES'])) $data[$i]['TEXT_STRLINES'] = $this->mt_StringToLines($data[$i]['CELL_WIDTH'], $data[$i]['TEXT']);
        $data[$i]['CELL_LINES'] = count($data[$i]['TEXT_STRLINES']);
        
        /**
         * IF THERE IS ROWSPAN ACTIVE Don't include this cell Height in the calculation. 
         * This will be calculated later with the sum of all heights
         */
        
        $data[$i]['HEIGHT'] = $data[$i]['LN_SIZE'] * $data[$i]['CELL_LINES'];
        
        if ( $data[$i]['ROWSPAN'] == 1 ){
        	$hm = max($hm, $data[$i]['HEIGHT']);//this would be the normal height
        }
        
		if ( $data[$i]['COLSPAN'] > 1 ){
			//just skip the other cells
			$iActiveColspan = $data[$i]['COLSPAN'];
		}//if
		
	}//for($i=0; $i < $this->iColumnsNr; $i++)	
	
	
	$aDataCache[] = array(
		'HEIGHT' => $hm,	//THIS LINE MAXIMUM HEIGHT
		'DEFAULT_HEIGHT' => $hm,	//THIS LINE DEFAULT MAXIMUM HEIGHT
		'DEFAULT_HEIGHT_SET' => true,
		'DATATYPE' => $sDataType,	//The data Type - Data/Header
		'DATA' => $data,	//this line's data
		'ROWSPAN' => $aRowSpan	//rowspan ID array
	);
	
	//we set the rowspan in cache variable to true if we have a rowspan
	if (! empty($aRowSpan) && (!$this->bRowSpanInCache)){
		$this->bRowSpanInCache = true;
	}
	
	return;
}//function _tbAddDataToCache



/**
 * Parses the Data Cache and calculates the maximum Height of each row. Normally the cell Height of a row is calculated 
 * when the data's are added, but when that row is involved in a Rowspan then it's Height can change!
 *
 * @access 	protected
 * @param	integer	$iStartIndex - the index from which to parse
 * @param	string	$sCacheType - what type has the cache - possible values: 'header' && 'data'
 * @return	void
 */
protected function _tbCacheParseRowspan($iStartIndex = 0, $sCacheType = 'data'){
	
	if ($sCacheType == 'data')
		$aDataCache = & $this->aDataCache;
	else 
		$aDataCache = & $this->aHeaderCache;
	
	$aRowSpans = array();
	
	$iItems = count($aDataCache);
	
	for ($ix = $iStartIndex; $ix < $iItems; $ix++){
		
		$val = & $aDataCache[$ix];
	
		if (!in_array($val['DATATYPE'], array('data', 'header') )) continue;
		
		//if there is no rowspan jump over
		if (empty($val['ROWSPAN'])) continue;
		
		foreach ($val['ROWSPAN'] as $k){
			
			#$val['HEIGHT'] = $val['DEFAULT_HEIGHT'];			
			
			if ($val['DATA'][$k]['ROWSPAN'] < 1) continue;	//skip the rows without rowspan
			
			/**
			if ($val['DEFAULT_HEIGHT_SET'] == false){
				$val['HEIGHT'] = $val['DEFAULT_HEIGHT'];
			}
			*/
			
			$aRowSpans[] = array(
				'row_id' => $ix,
				'cell_id' => &$val['DATA'][$k]
			);
			
			$h_rows = 0;
			
			//calculate the sum of the Heights for the lines that are included in the rowspan
			for ( $i=0; $i < $val['DATA'][$k]['ROWSPAN']; $i++){
				if (isset($aDataCache[$ix + $i]))
					$h_rows += $aDataCache[$ix + $i]['HEIGHT'];
			}
			
			//this is the cell height that makes the rowspan
			$h_cell = $val['DATA'][$k]['HEIGHT'];
			
			//if the 
			//$val['DATA'][$k]['HEIGHT_MAX'] = max($h_cell, $h_rows);
			
			/**
			 * The Rowspan Cell's Height is bigger than the sum of the Rows Heights that he is spanning
			 * In this case we have to increase the height of each row
			 */
			if ($h_cell > $h_rows){
				//calculate the value of the HEIGHT to be added to each row
				$add_on = ($h_cell - $h_rows) / $val['DATA'][$k]['ROWSPAN'];
				for ( $i=0; $i < $val['DATA'][$k]['ROWSPAN']; $i++){
					if (isset($aDataCache[$ix + $i])){
						$aDataCache[$ix + $i]['HEIGHT'] += $add_on;
						$aDataCache[$ix + $i]['DEFAULT_HEIGHT_SET'] = false;
					}
				}//for
			}//
			
		}//foreach
	}//foreach
	
	
	
	
	/**
	 * Calculate the height of each cell that makes the rowspan. 
	 * The height of this cell is the sum of the heights of the rows where the rowspan occurs
	 */
	
	foreach ($aRowSpans as $val1){
		$h_rows = 0;
		//calculate the sum of the Heights for the lines that are included in the rowspan
		for ( $i=0; $i < $val1['cell_id']['ROWSPAN']; $i++){
			if (isset($aDataCache[$val1['row_id'] + $i]))
				$h_rows += $aDataCache[$val1['row_id'] + $i]['HEIGHT'];
		}
		$val1['cell_id']['HEIGHT_MAX'] = $h_rows;
		if (false == $this->bTableSplit){
		    $aDataCache[$val1['row_id']]['HEIGHT_ROWSPAN'] = $h_rows;
		}
	}
	
}//function _tbCacheParseRowspan


/**
 * Splits a cell into 2 cells. The first cell will have maximum $iHeightMax height
 *
 * @access 		protected
 * @param		array - $aCellData - array containing cell data
 * @param 		integer - $iRowHeight - the Height of the row that contains this cell
 * @param		integer - $iHeightMax - the maximum Height of the first cell
 * @return 		$aNewData - the second cell value
 */
protected function tbSplitCell(&$aCellData, $iHeightRow = 0, $iHeightMax = 0){
	
	//$aTData will contain the second cell data
	$aCell2Data = $aCellData;
	$fHeightSplit = 0;		//The Height where the split will be made
	
	/**
	 * Have to look at the V_ALIGN of the cells and calculate exaclty for each cell how much space is left
	 */
	switch($aCellData['V_ALIGN']){
		case 'M':
			//Middle align
			$x = ($iHeightRow - $aCellData['HEIGHT']) / 2;

			if ($iHeightMax  <= $x){
				//CASE 1
				$fHeightSplit = 0;
				$aCellData['V_OFFSET'] = $x - $iHeightMax;
				$aCellData['V_ALIGN'] = 'T';//top align
				
			}elseif( ($x + $aCellData['HEIGHT']) >= $iHeightMax){
				//CASE 2
				$fHeightSplit = $iHeightMax - $x;
				$aCellData['V_ALIGN'] = 'B';//top align
				$aCell2Data['V_ALIGN'] = 'T';//top align
			}else{//{
				//CASE 3
				$fHeightSplit = $iHeightMax;
				$aCellData['V_OFFSET'] = $x;
				$aCellData['V_ALIGN'] = 'B';//bottom align
			}
													
			break;
		case 'B':
			//Bottom Align
			if (($iHeightRow - $aCellData['HEIGHT']) > $iHeightMax){
				//if the text has enough place on the other page then we show nothing on this page
				$fHeightSplit = 0;
			}else{
				//calculate the space that the text needs on this page 
				$fHeightSplit = $iHeightMax - ($iHeightRow - $aCellData['HEIGHT']);
			}
			
			break;
			
		case 'T':
		default:
			//Top Align and default align 
			$fHeightSplit = $iHeightMax;
			break;
	}

	//calculate the number of the lines that have space on the $fHeightSplit
	$iNoLinesCPage = floor($fHeightSplit / $aCellData['LN_SIZE']);
	//if the number of the lines is bigger than the number of the lines in the cell decrease the number of the lines
	if ($iNoLinesCPage > $aCellData['CELL_LINES']){
		$iNoLinesCPage = $aCellData['CELL_LINES'];
	}
										
	$aCellData['TEXT_SPLITLINES'] = array_splice($aCellData['TEXT_STRLINES'], $iNoLinesCPage);
	#$aCellData['CELL_LINES'] = $iNoLinesCPage;
	$aCellData['CELL_LINES'] = count($aCellData['TEXT_STRLINES']);
	
	//calculate the new height for this cell
	$aCellData['HEIGHT'] = $aCellData['LN_SIZE'] * $aCellData['CELL_LINES'];
	
	#$fRowH = max($fRowH, $aData[$j]['HEIGHT'] );
	
	//this is the second cell from the splitted one
	$aCell2Data['TEXT_STRLINES'] = $aCellData['TEXT_SPLITLINES'];
	$aCell2Data['CELL_LINES'] = count ($aCell2Data['TEXT_STRLINES']);
	$aCell2Data['HEIGHT'] = $aCell2Data['LN_SIZE'] * $aCell2Data['CELL_LINES'];
	
	return array($aCell2Data, $fHeightSplit);
				
}//function tbSplitCell()

/**
 * Splits the Data Cache into Pages. 
 * Parses the Data Cache and when it is needed then a "new page" command is inserted into the Data Cache. 
 *
 * @access 	protected
 * @param 	void
 * @return 	void
 */
protected function _tbCachePaginate(){

	$iPageHeight = $this->PageHeight();

	/**
	 * This Variable will contain the remained page Height
	 */
	$iLeftHeight = $iPageHeight - $this->GetY() + $this->tMargin;

	//the number of lines that the header contains
	if ($this->bTableHeaderDraw){
		$iHeaderLines = count($this->aHeaderCache);	
	}else {
		$iHeaderLines = 0;
	}
		
	$bWasData = true;		//can be deleted
	$iLastOkKey = -1;		//can be deleted
	
	$bDataOnThisPage = false;
	$bHeaderOnThisPage = false;
	$iLastDataKey = 0;

	
	//will contain the rowspans on the current page, EMPTY THIS VARIABLE AT EVERY NEW PAGE!!!
	$aRowSpans = array();
	
	$aDC = & $this->aDataCache;
	
	$iItems = count($aDC);
	
	for ($i=0; $i < $iItems; $i++){
		
		$val = & $aDC[$i];
		
		$bIsHeader = $val['DATATYPE'] == 'header';
		
		if (($bIsHeader) && ($bWasData)){
			$iLastDataKey = $iLastOkKey;
		}//fi
		
		if (isset($val['ROWSPAN'])){
			
			foreach ($val['ROWSPAN'] as $k=>$v){
				$aRowSpans[] = array($i, $v);
				$aDC[$i]['DATA'][$v]['HEIGHT_LEFT_RW'] = $iLeftHeight;
			}//foreach
			
		}//fi
		
		$iLeftHeightLast = $iLeftHeight;
		
		$iRowHeight = $val['HEIGHT'];
		$iRowHeightRowspan = 0;
		if ((false == $this->bTableSplit) && (isset($val['HEIGHT_ROWSPAN']))){
		    $iRowHeightRowspan = $val['HEIGHT_ROWSPAN'];
		}
		
        $iLeftHeightRowspan = $iLeftHeight - $iRowHeightRowspan;				
		$iLeftHeight -= $iRowHeight;

		if (($iLeftHeight >= 0) && ($iLeftHeightRowspan >=0)){
			//this row has enough space on the page
			if (true == $bIsHeader) {
				$bHeaderOnThisPage = true;
			}else{
				$iLastDataKey = $i;
				$bDataOnThisPage = true;
			}
			$iLastOkKey = $i;
			$bLastOkType = $bIsHeader;
			
		}else{
							
			/**
			 * THERE IS NOT ENOUGH SPACE ON THIS PAGE - HAVE TO SPLIT
			 * Decide the split type
			 * 
			 * SITUATION 1:
			 * IF
			 * 		- the current data type is header OR
			 * 		- on this page we had no data(that means untill this point was nothing or just header) AND bTableSplit is off
			 * THEN we just add new page on the positions of LAST DATA KEY ($iLastDataKey)
			 * 
			 * SITUATION 2:
			 * IF
			 * 		- TableSplit is OFF and the height of the current data is bigger than the Page Height minus (-) Header Height
			 * THEN we split the current cell
			 * 
			 * SITUATION 3:
			 * 		- normal split flow
			 *  
			 */
			
			//use this switch for flow control
			switch(1){
				case 1:
				
				//SITUATION 1:
				if ((true == $bIsHeader) OR ((false == $bHeaderOnThisPage) AND (false == $bDataOnThisPage) AND (false == $this->bTableSplit)) ){
					$iItems = $this->tbInsertNewPage($iLastDataKey, null, (!$bIsHeader) && (!$bHeaderOnThisPage));
					break;//exit from switch(1);
				}

				$bSplitCommand = $this->bTableSplit;
				
				//SITUATION 2:
				if ($val['HEIGHT'] > ($iPageHeight - $this->iHeaderHeight)){
					//even if the bTableSplit is OFF - split the data!!!
					$bSplitCommand = true;
				}

				if (true == $bSplitCommand){
				/***************************************************
				 * * * * * * * * * * * * * * * * * * * * * * * * * * 
				 * SPLIT IS ACTIVE
				 * * * * * * * * * * * * * * * * * * * * * * * * * * 
				 ***************************************************/
								
					//if we can draw on this page at least one line from the cells
					$bAtLeastOneLine = false;
					
					$aData = $val['DATA'];
					
					$fRowH = $iLeftHeightLast;
					#$fRowH = 0;
					$fRowHTdata = 0;
					
					$aTData = array();
					
					//parse the data's on this line
					for( $j=0; $j < $this->iColumnsNr; $j++){
						
						$aTData[$j] = $aData[$j];
						
						/**
						 * The cell is Skipped or is a Rowspan. For active split we handle rowspanned cells later
						 */
						if (($aData[$j]['SKIP'] === TRUE) || ($aData[$j]['ROWSPAN'] > 1)) continue;
						
						list($aTData[$j]) = $this->tbSplitCell($aData[$j], $val['HEIGHT'], $iLeftHeightLast);
						
						$fRowH = max($fRowH, $aData[$j]['HEIGHT'] );
						$fRowHTdata = max($fRowHTdata, $aTData[$j]['HEIGHT'] );
										
					}//for
					
					$val['HEIGHT'] = $fRowH;
					$val['DATA'] = $aData;				
					
					$v_new = $val;
					$v_new['HEIGHT'] = $fRowHTdata;
					$v_new['ROWSPAN'] = array();
					/**
					 * Parse separately the rows with the ROWSPAN
					 */
					
					
					$bNeedParseCache = false;
					
					$aRowSpan = $aDC[$i]['ROWSPAN'];
					
					
					foreach ($aRowSpans as $rws_key => $rws){
										
						$rData = & $aDC[$rws[0]]['DATA'][$rws[1]];
															
						if ($rData['HEIGHT_MAX'] > $rData['HEIGHT_LEFT_RW']){
							/**
							 * This cell has a rowspan in IT
							 * We have to split this cell only if its height is bigger than the space to the end of page
							 * that was set when the cell was parsed. HEIGHT_LEFT_RW 
							 */
													
							list($aTData[$rws[1]], $fHeightSplit)  = $this->tbSplitCell($rData, $rData['HEIGHT_MAX'] , $rData['HEIGHT_LEFT_RW']);
				
							$rData['HEIGHT_MAX'] = $rData['HEIGHT_LEFT_RW'];
												
							$aTData[$rws[1]]['ROWSPAN'] = $aTData[$rws[1]]['ROWSPAN'] - ($i - $rws[0]);
							
							$v_new['ROWSPAN'][] = $rws[1];
							
							$bNeedParseCache = true;												
						}//fi
					}//foreach
					
					$v_new['DATA'] = $aTData;
					
					//Insert the new page, and get the new number of the lines
					$iItems = $this->tbInsertNewPage($i, $v_new);
					
					if ($bNeedParseCache) $this->_tbCacheParseRowspan($i+1);
					
				}else{
					
				/***************************************************
				 * * * * * * * * * * * * * * * * * * * * * * * * * * 
				 * SPLIT IS INACTIVE
				 * * * * * * * * * * * * * * * * * * * * * * * * * * 
				 ***************************************************/
	
					/**
					 * Check if we have a rowspan that needs to be splitted
					 */
					
					#var_dump($aRowSpans); die();
					$bNeedParseCache = false;
					
					$aRowSpan = $aDC[$i]['ROWSPAN'];
					
					foreach ($aRowSpans as $rws){
										
						$rData = & $aDC[$rws[0]]['DATA'][$rws[1]];
						
						if ($rws[0] == $i)continue;	//means that this was added at the last line, that will not appear on this page
										
						if ($rData['HEIGHT_MAX'] > $rData['HEIGHT_LEFT_RW']){
							/**
							 * This cell has a rowspan in IT
							 * We have to split this cell only if its height is bigger than the space to the end of page
							 * that was set when the cell was parsed. HEIGHT_LEFT_RW 
							 */
							
							list($aTData, $fHeightSplit)  = $this->tbSplitCell($rData, $rData['HEIGHT_MAX'] , $rData['HEIGHT_LEFT_RW'] - $iLeftHeightLast);
				
							$rData['HEIGHT_MAX'] = $rData['HEIGHT_LEFT_RW'] - $iLeftHeightLast;
												
							$aTData['ROWSPAN'] = $aTData['ROWSPAN'] - ($i - $rws[0]);
							
							$aDC[$i]['DATA'][$rws[1]] = $aTData;
							
							$aRowSpan[] = $rws[1];
							$aDC[$i]['ROWSPAN'] = $aRowSpan;
							
							$bNeedParseCache = true;
													
						}//fi
					}//for
					
					if ($bNeedParseCache) $this->_tbCacheParseRowspan($i);
	
					//Insert the new page, and get the new number of the lines
					$iItems = $this->tbInsertNewPage($i);
	
				}//else				
							
				
			}//switch(1);
			
			$iLeftHeight = $iPageHeight;
			$aRowSpans = array();
			$bDataOnThisPage = false;	//new page
			
		}//else
		
		
	}//for
	
}//function _tbCachePaginate



/**
 * Inserts a new page in the Data Cache, after the specified Index. If sent then also a new data is inserted after the new page
 *
 * @access 		protected
 * @param		integer	- $iIndex - after this index is the new page inserted
 * @param		resource - $rNewData - default null. If specified this data is inserted after the new page
 * @param 		boolean	- $bInsertHeader - true then the header is inserted, false - no header is inserted
 * @return 		integer - the new number of lines that the Data Cache Contains. 
 */
protected function tbInsertNewPage($iIndex, $rNewData = null, $bInsertHeader = true){
	
	//the number of lines that the header contains
	if ((true == $this->bTableHeaderDraw) && (true == $bInsertHeader)){
		$iHeaderLines = count($this->aHeaderCache);	
	}else {
		$iHeaderLines = 0;
	}
	
	$aDC = & $this->aDataCache;
	$iItems = count($aDC);		//the number of elements in the cache

	//if we have a NewData to be inserted after the new page then we have to shift the data with 1
	if( null != $rNewData) $iShift = 1;
	else $iShift = 0;
	
	//shift the array with the number of lines that the header contains + one line for the new page
	for($j = $iItems; $j > $iIndex; $j--){
		$aDC[$j + $iHeaderLines + $iShift] = $aDC[$j - 1];
	}//for
		
	$aDC[$iIndex + $iShift] = array(
	    'HEIGHT' => 0, 
	    'DATATYPE' => 'new_page',
	);
	
	$j = $iShift;
	
	
	if ($iHeaderLines > 0){
		//only if we have a header
		
		//insert the header into the corresponding positions
		foreach ($this->aHeaderCache as $rHeaderVal){
			$j++;
			$aDC[$iIndex + $j] = $rHeaderVal;
		}//foreach
		
	}//fi
	
	if( 1 == $iShift ){
		$j++;
		$aDC[$iIndex + $j] = $rNewData;	
	}//fi
	
	/**/
	$this->bDataOnCurrentPage = false;
	
	return count($aDC);
	
}//function tbInsertNewPage



/**
 * Sends all the Data Cache to the PDF Document. 
 * This is the REAL Function that Outputs the table data to the pdf document
 *
 * @access 	protected
 * @param 	void
 * @return 	void
 */
protected function _tbCachePrepOutputData(){
	
	$aDataCache = & $this->aDataCache;
			
	$iItems = count($aDataCache);
	
	for ($k=0; $k < $iItems; $k++){
		
	$val = & $aDataCache[$k];
		
		//each array contains one line
		$this->_tbAlign();
		
		if ($val['DATATYPE'] == 'new_page') {
			//add a new page
			$this->tbAddPage();
			continue;
		}
		
		$data = &$val['DATA'];
				
		//Draw the cells of the row
		for( $i = 0; $i < $this->iColumnsNr; $i++ )
		{
			
			//Save the current position
			$x=$this->GetX();
			$y=$this->GetY();
			
			if ($data[$i]['SKIP'] === FALSE){
				
				if (isset($data[$i]['HEIGHT_MAX'])) 
					$h = $data[$i]['HEIGHT_MAX'];
				else 
					$h = $val['HEIGHT'];
				
			
				//border size BRD_SIZE
				$this->SetLineWidth($data[$i]['BRD_SIZE']);
		
				//fill color = BG_COLOR
				list($r, $g, $b) = $data[$i]['BG_COLOR'];
				$this->SetFillColor($r, $g, $b);
		
				//Draw Color = BRD_COLOR
				list($r, $g, $b) = $data[$i]['BRD_COLOR'];
				$this->SetDrawColor($r, $g, $b);
		
				//Text Color = T_COLOR
				list($r, $g, $b) = $data[$i]['T_COLOR'];
				$this->SetTextColor($r, $g, $b);
		
				//Set the font, font type and size
				$this->SetFont(	$data[$i]['T_FONT'],
								$data[$i]['T_TYPE'],
								$data[$i]['T_SIZE']);
			
				//print the text
				$this->tbMultiCellTbl(
						$data[$i]['CELL_WIDTH'],
						$data[$i]['LN_SIZE'],
						$data[$i]['TEXT_STRLINES'],
						$data[$i]['BRD_TYPE'],
						$data[$i]['T_ALIGN'],
						$data[$i]['V_ALIGN'],
						1,
						$h - $data[$i]['HEIGHT']
						);
			}
	
			//Put the position to the right of the cell
			$this->SetXY($x + $data[$i]['CELL_WIDTH'],$y);
	
			//if we have colspan, just ignore the next cells
			if (isset($data[$i]['COLSPAN'])){
				$i = $i + (int) $data[$i]['COLSPAN'] - 1;
			}
	
		}//for
	
		$this->bDataOnCurrentPage = true;
	
		//Go to the next line
		$this->Ln($val['HEIGHT']);
	}//foreach	
	
}//function _tbCachePrepOutputData


/**
 * Prepares the cache for Output.
 * 
 * Parses the cache for Rowspans, Paginates the cache and then send the data to the pdf document
 * @access 	protected
 * @param 	void
 * @return 	void
 */
protected function _tbCachePrepOutput(){
	
	if ($this->bRowSpanInCache) $this->_tbCacheParseRowspan();
	
	$this->_tbCachePaginate();
	
	$this->_tbCachePrepOutputData();
}



/**
 * Adds a new page in the pdf document and initializes the table and the header if necessary.
 *
 * @access 	protected
 * @param	void	 
 * @return	void
 */
protected function tbAddPage($bHeader = true){
    
	$this->tbDrawBorder();//draw the table border

    $this->_tbEndPageBorder();//if there is a special handling for end page??? this is specific for me
    
    $bUtf8Set = false;

	//IF UTF8 Support is needed then 
	if (isset($this->utf8_support) && ($this->utf8_support)){
		//keep the compatibility with the "old" fpdf utf8 support.
		if (isset($this->utf8_decoded)){
			$old_utf8_decoded = $this->utf8_decoded;
			$this->utf8_decoded = false;
			$bUtf8Set = true;
		}		
	}    
    
    $this->AddPage($this->CurOrientation);//add a new page
    
	//IF UTF8 Support is needed then
	if ($bUtf8Set){
		 $this->utf8_decoded = $old_utf8_decoded;
	}

    $this->bDataOnCurrentPage = false;

    $this->iTableStartX = $this->GetX();
    $this->iTableStartY = $this->GetY();
    $this->tbMarkMarginX();
    
}//function tbAddPage


/**   This method allows printing text with line breaks.
      It works like a modified MultiCell
      Call:
      @param
                        $w - width
                        $h - line height
                        $txtData - the outputed text
                        $border - border(LRTB 0 or 1)
                        $align - horizontal align 'JLR'
                        $valign - Vertical Alignment - Top, Middle, Bottom
                        $fill - fill (1/0)
                        $vh - vertical adjustment - the Multicell Height will be with this VH Higher!!!!
                        $vtop - vertical top add-on
      @return           nothing
*/
/**
 * Ouputs a Table Cell. It works like a modified MultiCell.
 *
 * @param 	integer $w	- cell width
 * @param	integer $h	- line height
 * @param	array	$txtData - variable that contains the data to be outputted. This data is already formatted!!!
 * @param	string 	$border - border(LRTB 0 or 1)
 * @param	string 	$align - horizontal align 'JLR'
 * @param 	string 	$valign - Vertical Alignment - Top, Middle, Bottom
 * @param 	string	$fill - Cell Fill (0 no Fill, 1 fill)
 * @param	integer	$vh	- Vertical Adjustment	- the Multicell Height will be with this VH Higher!!!!
 * @param	integer	$vtop - vertical top add-on
 * @param	integer $pad_left - Cell Pad left - NOT IMPLEMENTED
 * @param 	integer $pad_top - Cell Pad left - NOT IMPLEMENTED
 * @param 	integer $pad_right - Cell Pad left - NOT IMPLEMENTED
 * @param 	integer $pad_bottom - Cell Pad left - NOT IMPLEMENTED
 * @return 	void
 */
function tbMultiCellTbl($w, $h, $txtData, $border=0, $align='J', $valign='T', $fill=0, $vh=0, $vtop=0, $pad_left=0, $pad_top=0, $pad_right=0, $pad_bottom=0){

	$b1 = '';//border for top cell
	$b2 = '';//border for middle cell
	$b3 = '';//border for bottom cell
	$wh_Top = 0;
	
	if ($vtop > 0){//if this parameter is set
		if($vtop < $vh){//only if the top add-on is bigger than the add-width
			$wh_Top = $vtop;
			$vh = $vh - $vtop;
		}
	}
	
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
			$b1=is_int(strpos($border,'T')) ? $b2.'T' : $b2;
			$b3=is_int(strpos($border,'B')) ? $b2.'B' : $b2;

		}
	}
	
	if (empty($txtData)){
		//draw the top borders!!!
		$this->Cell($w,$vh,'',$border,2,$align,$fill);//19.01.2007 - andy
		return;
	}
	
	
	

	switch ($valign){
		case 'T':
			$wh_T = $wh_Top;//Top width
			$wh_B = $vh - $wh_T;//Bottom width
			break;
		case 'M':
			$wh_T = $wh_Top + $vh/2;
			$wh_B = $vh/2;
			break;
		case 'B':
			$wh_T = $wh_Top + $vh;
			$wh_B = 0;
			break;
		default://default is TOP ALIGN
			$wh_T = $wh_Top;//Top width
			$wh_B = $vh - $wh_T;//Bottom width
	}

	//save the X position
	$x = $this->x;
	/*
		if $wh_T == 0 that means that we have no vertical adjustments so I will skip the cells that
		draws the top and bottom borders
	*/

	if ($wh_T > 0)//only when there is a difference
	{
		//draw the top borders!!!
		$this->Cell($w,$wh_T,'',$b1,2,$align,$fill);//19.01.2007 - andy
	}
	
	$b2 = is_int(strpos($border,'T')) && ($wh_T == 0) ? $b2.'T' : $b2;
	$b2 = is_int(strpos($border,'B')) && ($wh_B == 0) ? $b2.'B' : $b2;		
	$this->MultiCellTag($w, $h, $txtData, $b2, $align, 1, $pad_left, $pad_top, $pad_right, $pad_bottom, false);

	if ($wh_B > 0){//only when there is a difference

		//go to the saved X position
		//a multicell always runs to the begin of line
		$this->x = $x;

		$this->Cell($w, $wh_B, '', $b3, 2, $align,$fill);//19.01.2007 - andy

		#$this->x = $this->lMargin;//andy 23.02.2006
		$this->x = $x;
	}

}//function tbMultiCellTbl


/**
 * Sends to the pdf document the cache data
 * 
 * @access 	public
 * @param 	void
 * @return 	void
 */
public function tbOuputData(){
	$this->_tbCachePrepOutput();

	//IF UTF8 Support is needed then 
	if (isset($this->utf8_support) && ($this->utf8_support)){
		//keep the compatibility with the "old" fpdf utf8 support.
		if (isset($this->utf8_decoded)) $this->utf8_decoded = false;		
	}
}//function tbOuputData


}//end of pdf_table class

?>