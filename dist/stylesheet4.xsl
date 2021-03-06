<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:bs="http://www.battlescribe.net/schema/rosterSchema" 
                xmlns:exslt="http://exslt.org/common" 
                extension-element-prefixes="exslt">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:variable name="specialisms" select="'Leader|Combat|Zealot|Demolitions|Comms|Veteran|Scout|Heavy|Medic|Sniper|Strength|Strategist'"/>
    <xsl:variable name="advances" select="'1. Fleet|2. Lucky|3. Courageous|4. Skilled|5. Lethal|6. Die-hard'"/>
	<xsl:variable name="Faction" select="bs:roster/bs:forces/bs:force/@catalogueName"/>
	<xsl:template match="bs:roster/bs:forces/bs:force">
		<html>
		<head>
			<style>
					<!-- inject:../build/style.css -->
					@import url("https://fonts.googleapis.com/css?family=Oswald:600|EB+Garamond:400,400i,700");
body {
	-webkit-print-color-adjust: exact !important;
  font-family: "EB Garamond", serif; }

th {
  background-color: #E1501E;
  padding: 1pt;
  font-family: "Oswald", sans-serif; }

h1 {
  text-align: center;
  font-size: 42pt;
  text-transform: uppercase;
  font-family: "Oswald", sans-serif;
  font-weight: bold;
  margin: 0; }

h2 {
  font-size: 24pt;
  font-family: "Oswald", sans-serif;
  margin: 0;
  padding-left: 0.1cm; }

#resources {
  margin-bottom: 0.5cm; }

table.campaign {
  width: 100%; }
  table.campaign th, table.campaign td {
    width: 20%; }
  table.campaign tr > th:first-child {
    text-align: left;
    padding-left: 0.2cm; }
  table.campaign tr > td:last-child {
    width: 10%;
    text-align: center; }
  table.campaign td {
    border: 1px solid #666666;
    padding-left: 5px; }
  table.campaign table.resource {
    width: 100%; }
    table.campaign table.resource td {
      border: none;
      padding-left: 0px; }
    table.campaign table.resource td:last-child {
      text-align: right;
      width: 50%;
      padding-right: 0.5cm; }

#roster-header > table {
  width: 100%;
  margin-bottom: 0.5cm; }
  #roster-header > table th, #roster-header > table td {
    width: 25%; }
  #roster-header > table th {
    text-transform: uppercase; }
  #roster-header > table td {
    border: 1px solid #666666;
    font-weight: 600;
    font-size: 14pt;
    text-align: center; }

table.roster {
  width: 100%;
  background-color: #FFFFFF; }
  table.roster th {
    width: 14.28571%;
    font-size: 12pt;
    font-family: 'Oswald', sans-serif;
    text-transform: uppercase; }
  table.roster td {
    background-color: #dfdfdf;
    text-align: center;
    font-size: 10pt; }
    table.roster td > div {
      font-size: 6pt;
      font-style: italic; }

.card {
  width: 11.3cm;
  height: 7.3cm;
  background-color: #FFFFFF;
  border-radius: 8px;
  padding: 0.2cm;
  font-size: 10pt;
  border: 1px solid #bbbbbb;
  display: table; }
  .card .header {
    display: table; }
    .card .header > div {
      display: table-cell;
      width: 3.76667cm; }
      .card .header > div:nth-child(2) {
        text-align: center;
		font-weight: bold; }
      .card .header > div:nth-child(3) {
        text-align: right;
        font-weight: bold; }
  .card table {
    width: 100%;
    font-size: 8pt;
    text-align: center;
    text-transform: uppercase; }
  .card th {
    border-top: 1px solid #222E33;
    border-bottom: 1px solid #222E33; }
    .card th:first-child {
      text-align: left;
      min-width: 2cm;
      padding-left: 0.1cm; }
  .card td {
    background-color: #dfdfdf;
    border-left: 1px solid #FFFFFF;
    border-right: 1px solid #FFFFFF;
    border-bottom: 2px solid #FFFFFF;
    text-transform: none; }
    .card td:first-child {
      text-align: left;
      min-width: 2cm;
      width: 2cm;
      padding-left: 0.1cm;
      border-left: none; }
    .card td:last-child {
      border-right: none; }
    .card td.sub-header {
      background-color: transparent;
      font-weight: bold;
      font-family: "Oswald", sans-serif; }
    .card td.sub-body {
      background-color: transparent;
      font-weight: bold;
      text-align: left;
      padding-left: 0.1cm; }

.unit th, .unit td {
  font-weight: bold; }
  .unit th:not(:first-child), .unit td:not(:first-child) {
    width: 0.91cm; }

.unit td {
  font-size: 10pt; }

.weapons th:not(:first-child):not(:last-child), .weapons td:not(:first-child):not(:last-child) {
  width: 1.22cm; }

.weapons th:last-child, .weapons td:last-child {
  min-width: 3cm; }

.weapons td {
  border-bottom: 2px solid #FFFFFF; }

.specialism > div, .psyker > div, .abilities > div {
  float: left; }

.specialism tr:first-child > td, .psyker tr:first-child > td, .abilities tr:first-child > td {
  background-color: #FFFFFF;
  font-family: "Oswald", sans-serif;
  font-size: 10pt; }

.specialism tr:first-child > td:last-child, .psyker tr:first-child > td:last-child, .abilities tr:first-child > td:last-child {
  text-align: left; }

.card-footer {
  display: table-footer-group; }

.exp {
  font-size: 0.8em;
  display: table;
  width: 11.3cm; }
  .exp > div {
    display: table-cell; }
    .exp > div > span:nth-child(3), .exp > div span:nth-child(7), .exp > div span:nth-child(12) {
      color: #E1501E; }

@media screen {
  #cards {
    display: flex;
    flex-wrap: wrap; }
    #cards .card {
      margin: 0.2cm; } }

@media print {
  #roster {
    page-break-after: always; }
  .card {
    page-break-inside: avoid; } }

					<!-- endinject -->
			</style>
		</head>
		<body>
			<xsl:apply-templates select="bs:selections/bs:selection[@name='List Configuration']" mode="list-configuration"/>
			<section id="cards">
				<xsl:apply-templates select="bs:selections/bs:selection[@type='upgrade']" mode="card"/>
				<xsl:apply-templates select="bs:selections/bs:selection[@type='unit']/bs:selections/bs:selection[@type='model']" mode="card"/>
			</section>
		</body>
		</html>
	</xsl:template>
	
    <!-- inject:card.xsl -->
    	<!-- Renders the unit cards -->
	<xsl:template match="bs:selection[@type='upgrade']" mode="card">
		<xsl:variable name="nodePoints">
	        <xsl:for-each select="bs:selections/bs:selection">
	            <xsl:choose>
	                <xsl:when test="contains($specialisms, @name)">
	                    <xsl:for-each select="bs:selections/bs:selection/bs:costs/bs:cost">
	                        <ItemCost>
	                            <xsl:value-of select="@value"/>
	                        </ItemCost>
	                    </xsl:for-each>
	                </xsl:when>
	                <xsl:otherwise>
	                    <ItemCost>
	                        <xsl:value-of select="bs:costs/bs:cost/@value"/>
	                    </ItemCost>
	                </xsl:otherwise>
	            </xsl:choose>
	        </xsl:for-each>
	    </xsl:variable>
	    <xsl:variable name="subTotal" select="exslt:node-set($nodePoints)"/>
		<div class="card">
			<div class="header"> <!-- NAME -->
	            <div> <!-- CUSTOM NAME -->
	                <xsl:value-of select="@customName"/>
	            </div>
							<div>  <!-- SUBFACTION -->
								<xsl:value-of select="$Faction"/>
							</div>
	            <div> <!-- POINTS -->
	                <xsl:value-of select="sum($subTotal/ItemCost) + bs:costs/bs:cost/@value"/>
	                 Points
	            </div>
	        </div>
			<!-- UNIT PROFILES -->
			<div> 
				<xsl:variable name="profiles" select="bs:profiles/bs:profile[@typeName='Characteristic']"/>
				<table class="unit" cellspacing="0">
					<tr>
						<th>
							Name
						</th>
						<xsl:apply-templates select="$profiles[1]" mode="header"/>
					</tr>
					<xsl:for-each select="$profiles">
						<tr>
							<td>
								<xsl:value-of select="@name"/>
							</td>
							<xsl:apply-templates mode="body"/>
						</tr>
					</xsl:for-each>
		        </table>
			</div>
			<!-- /UNIT PROFILES -->
			<!-- WEAPONS -->
			<div>
				<xsl:variable name="weapons" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Weapon']"/>
					<table class="weapons" cellspacing="0">
						<tr>
							<xsl:for-each select="$weapons[1]">
								<!--<th>
									<xsl:value-of select="@typeName"/>
								</th>-->
								<th>Weapons</th>
								<th>Range</th>
								<th>Attacks</th>
								<th>DAM+</th>
								<th>Special Rules</th>
								<!--<xsl:apply-templates mode="header"/>  -->                  
							</xsl:for-each>
						</tr>
						<xsl:for-each select="$weapons">
							<tr>
								<td>
									<xsl:value-of select="@name"/>
								</td>
								<xsl:apply-templates mode="body"/>                    
							</tr>
						</xsl:for-each>
					</table>
				</div>
				<!-- /WEAPONS -->

			<!-- GRENADE -->
			<div>
				<xsl:variable name="grenade" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Grenade']"/>
					<table class="weapons" cellspacing="0">
						<tr>
							<xsl:for-each select="$grenade[1]">
								<!--<th>
									<xsl:value-of select="@typeName"/>
								</th>-->
								<th>Grenade</th>
								<th>Range</th>
								<th>Attacks</th>
								<th>DAM+</th>
								<th>Special Rules</th>
								<!--<xsl:apply-templates mode="header"/>  -->                  
							</xsl:for-each>
						</tr>
						<xsl:for-each select="$grenade">
							<tr>
								<td>
									<xsl:value-of select="@name"/>
								</td>
								<xsl:apply-templates mode="body"/>                    
							</tr>
						</xsl:for-each>
					</table>
				</div>
				<!-- /GRENADE -->

				<!-- WARGEAR -->
				<div> 
					<xsl:variable name="wargear" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Relic']"/>
					<table class="weapons" cellspacing="0">
						<xsl:for-each select="$wargear">
							<tr>
								<th>Relics</th>
								<th>Description</th>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="@name"/>
								</td>
								<xsl:apply-templates mode="body"/>
							</tr>
						</xsl:for-each>
					</table>
				</div>
				<!-- /WARGEAR -->
				<!-- PSYCHIC ABILITIES -->
				<xsl:variable name="pabilities" select="bs:profiles/bs:profile[@typeName='Psychic Ability']"/>
				<xsl:if test="$pabilities">
					<div class="abilities">
							<table cellspacing="0">
								<tr>
									<td>Psychic:</td>
									<td></td>
								</tr>
								<xsl:for-each select="$pabilities">
								<tr>
									<td>
										<xsl:value-of select="@name"/>
									</td>
										<xsl:apply-templates mode="body"/>
								</tr>
								</xsl:for-each>
							</table>
					</div>
				</xsl:if>
			<!-- /PSYCHIC ABILITIES -->

            <!-- ABILITIES -->
				<xsl:variable name="abilities" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Ability']"/>
				<xsl:if test="$abilities">
					<div class="abilities">
							<table cellspacing="0">
								<tr>
									<td>Abilities:</td>
									<td></td>
								</tr>
								<xsl:for-each select="$abilities">
										<tr>
												<td>
														<xsl:value-of select="@name"/>
												</td>
												<xsl:apply-templates mode="body"/>
										</tr>
								</xsl:for-each>
							</table>
					</div>
				</xsl:if>
			<!-- /ABILITIES -->

			<!-- PSYCHIC POWERS -->
			<xsl:variable name="psyker" select="bs:profiles/bs:profile[@typeName='Psyker']"/>
			<xsl:variable name="psy-powers" select="bs:selections/bs:selection/bs:profiles/bs:profile[@typeName='Psychic Power']"/>
			<xsl:if test="$psy-powers">
				<div class="psyker">
					<table cellspacing="0">
						<tr>
							<td>Psyker:</td>
							<td>
								Manifest <xsl:value-of select="$psyker/bs:characteristics/bs:characteristic[@name='Manifest']"/> | Deny <xsl:value-of select="$psyker/bs:characteristics/bs:characteristic[@name='Deny']"/>
							</td>
						</tr>
						<xsl:for-each select="$psy-powers">
							<tr>
								<td>
									<xsl:value-of select="@name"/>
								</td>
								<xsl:apply-templates mode="body"/>
							</tr>
						</xsl:for-each>
					</table>
				</div>
			</xsl:if>
			<!-- /PSYCHIC POWERS -->

			<!-- SPECIALISM -->
			<xsl:variable name="specialism" select="bs:categories/bs:category"/>
				<xsl:if test="$specialism">
				<div class="specialism">
					<table cellspacing="0">
						<tr>
							<td>Unit Type:	</td>
							<td><xsl:value-of select="bs:categories/bs:category/@name"/></td>
						</tr>
						<tr>
								<xsl:apply-templates select="$specialism" mode="body"/>
						</tr>
					</table>
				</div>
				</xsl:if>
			<!-- /SPECIALISM -->


			<!-- EXP TRACK -->
			<div class="card-footer">
				<div class="exp">
					<div>Wounds: </div>
				
				<xsl:variable name="count" select="bs:profiles/bs:profile[@typeName='Characteristic']/bs:characteristics/bs:characteristic[@name='Health']"/>
				<xsl:for-each select="(//*)[position()&lt;=$count]">
 				<!-- Repeated content Here -->
 				<!-- use position() to get loop index -->
 				<xsl:value-of select="position()"/><span>&#9744;</span>
				<xsl:value-of select="count"/>
				</xsl:for-each>
				
				</div>
			</div>

			<div><xsl:value-of select="@catalogueName"/>
			</div>
			<!-- /EXP TRACK -->
		</div>
	</xsl:template>
    <!-- endinject -->
	
    <xsl:template match="bs:characteristics/bs:characteristic" mode="header">
        <th>
            <xsl:value-of select="@name"/>
        </th>
    </xsl:template>
    <xsl:template match="bs:characteristics/bs:characteristic" mode="body">
        <td>
            <xsl:value-of select="."/>    
        </td>
    </xsl:template>

</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="no" name="Scenario1" userelativepaths="yes" externalpreview="no" url="..\data\necrons-team.ros" htmlbaseurl="" outputurl="..\Necrons Team.html" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="schemaCache" value="||"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
		</scenario>
		<scenario default="yes" name="Scenario2" userelativepaths="yes" externalpreview="no" url="..\..\New Roster.xml" htmlbaseurl="" outputurl="..\..\Necrons TeamAN.html" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="schemaCache" value="||"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->