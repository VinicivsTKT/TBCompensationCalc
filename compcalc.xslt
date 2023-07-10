<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" version="5" />
	<xsl:param name="lang" />
	<xsl:template match="/resources">
		<html>
			<xsl:attribute name="lang"><xsl:value-of select="$lang" /></xsl:attribute>
			<head>
				<meta name="viewport" content="width=device-width" />
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title><xsl:value-of select="string[@name='app_name']" /></title>
				<meta name="author" content="Vinicivs" />
				<meta name="description" content="Compensation calculator for Total Battle." />
				<meta name="color-scheme" content="only light" />
				<link rel="preconnect" href="https://fonts.googleapis.com" />
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
				<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Vollkorn&amp;display=swap" />
				<link rel="stylesheet" href="styles.css" />
			</head>

			<body>
				<h1><xsl:value-of select="string[@name='app_name']" /></h1>

				<nav id="langs">
					<img src="language.svg" alt="Other languages" />
					<ul>
						<li><a href="index.html">English (en)</a></li>
						<li><a href="index-es.html">Español (es)</a></li>
						<li><a href="index-fr.html">Français (fr)</a></li>
						<li><a href="index-it.html">Italiano (it)</a></li>
						<li><a href="index-la.html">Latine (la)</a></li>
						<li><a href="index-pt.html">Português (pt)</a></li>
					</ul>
				</nav>

				<form name="compcalc" action="#" id="compcalc">
					<div id="frm_input">
						<div>
							<select name="unit" required="">
								<option label="Select the unit" />
								<optgroup>
									<xsl:attribute name="label"><xsl:value-of select="string[@name='group_guardsmen']"/></xsl:attribute>
									<option value="archers"><xsl:value-of select="string[@name='guard_archers']" /></option>
									<option value="spearmen"><xsl:value-of select="string[@name='guard_spearmen']" /></option>
									<option value="riders"><xsl:value-of select="string[@name='guard_riders']" /></option>
								</optgroup>
								<optgroup>
									<xsl:attribute name="label"><xsl:value-of select="string[@name='group_specialists']"/></xsl:attribute>
									<option value="swordsmen"><xsl:value-of select="string[@name='specialist_swordsmen']" /></option>
									<option value="spies"><xsl:value-of select="string[@name='specialist_spies']" /></option>
								</optgroup>
								<optgroup>
									<xsl:attribute name="label"><xsl:value-of select="string[@name='group_engineers']"/></xsl:attribute>
									<option value="catapults"><xsl:value-of select="string[@name='engineer_catapults']" /></option>
								</optgroup>
								<optgroup>
									<xsl:attribute name="label"><xsl:value-of select="string[@name='group_mercs']"/></xsl:attribute>
									<option value="merc_swift"><xsl:value-of select="string[@name='merc_swift']" /></option>
									<option value="merc_epic"><xsl:value-of select="string[@name='merc_epic']" /></option>
								</optgroup>
								<option value="others"><xsl:value-of select="string[@name='unit_custom']" /></option>
							</select>
						</div>
						<div>
							<label>
								<xsl:value-of select="string[@name='lbl_casualties']" />
								<xsl:text> </xsl:text>
								<input name="casualties" type="number" min="1" required="" />
							</label>
						</div>
						<div class="buttonbar">
							<button><xsl:value-of select="string[@name='action_add']" /></button>
						</div>
					</div>

					<div id="tbl_result">
						<div class="item" style="display:none">
							<div class="unitname" />
							<div>
								<span class="qtd" />
								<span class="mul" />
								<span class="cost" />
							</div>
						</div>
						<noscript>Sorry! This page only works with the JavaScript enabled browsers.</noscript>
						<div id="grandtotal">
							<div>
								<span class="label"><xsl:value-of select="string[@name='lbl_grandtotal']" /></span>
								<xsl:text> </xsl:text>
								<output name="grandtotal" class="cost">0</output>
							</div>
							<div>
								<span class="label"><xsl:value-of select="string[@name='lbl_grandtotal_wtax']" /></span>
								<xsl:text> </xsl:text>
								<output name="wtax" class="cost">0</output>
							</div>
						</div>
					</div>
				</form>

				<footer>
					<hr />
					<p>
						<span class="ornament">&#9884;</span>
						<xsl:text>&#160;Compensation calculator for Total Battle.&#160;</xsl:text>
						<span class="ornament">&#9884;</span><br />
						<xsl:text>Made by Vinicivs.</xsl:text>
					</p>
				</footer>
				<script src="compcalc.js" />
			</body>
		</html>
	</xsl:template>
</xsl:transform>
