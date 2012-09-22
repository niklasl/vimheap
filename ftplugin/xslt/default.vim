" Vim filetype plugin for XSLT
" Language: XSLT
"Maintainer: Niklas Lindström
" Last Change: 2003-05-01

" Re-use html ftplugin(s)
" WARNING: currently this is safe since it only contains mappings. If this
" changes it is wise to extract those to a 'mappings.vim' and source that
runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim

" Re-use xml ftplugin(s)
runtime! ftplugin/xml.vim ftplugin/xml_*.vim ftplugin/xml/*.vim

" XSLT 1.0 (with 'xsl:' as assumed namespace-prefix)
inorea <buffer> xsl__IABBREV <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><CR></xsl:stylesheet><ESC><Up>o
inorea <buffer> out__IABBREV <xsl:output method="xml" indent="yes" encoding="utf-8"/>
inorea <buffer> htmlout__IABBREV <xsl:output method="html" indent="no" encoding="utf-8" omit-xml-declaration="yes"/>
inorea <buffer> tm__IABBREV <xsl:template match=""><CR></xsl:template><ESC><Up>f"a
inorea <buffer> tn__IABBREV <xsl:template name=""><CR></xsl:template><ESC><Up>f"a
inorea <buffer> at__IABBREV <xsl:apply-templates ><Left>
inorea <buffer> ai__IABBREV <xsl:apply-imports/>
inorea <buffer> fe__IABBREV <xsl:for-each select=""><CR></xsl:for-each><ESC><Up>f"a
inorea <buffer> ct__IABBREV <xsl:call-template name=""><Left><Left>
inorea <buffer> var__IABBREV <xsl:variable name=""><Left><Left>
inorea <buffer> vo__IABBREV <xsl:value-of select=""/><Esc>2hi
inorea <buffer> par__IABBREV <xsl:param name=""><Left><Left>
inorea <buffer> wp__IABBREV <xsl:with-param name=""><Left><Left>
inorea <buffer> if__IABBREV <xsl:if test=""><CR></xsl:if><ESC><Up>f"a
inorea <buffer> ch__IABBREV <xsl:choose><CR></xsl:choose><ESC>O
inorea <buffer> wh__IABBREV <xsl:when test=""><CR></xsl:when><ESC><Up>f"a
inorea <buffer> ow__IABBREV <xsl:otherwise><CR></xsl:otherwise><ESC>O
inorea <buffer> cp__IABBREV <xsl:copy ><Left>
inorea <buffer> txt__IABBREV <xsl:text></xsl:text><Esc>F<i
inorea <buffer> attr__IABBREV <xsl:attribute name=""></xsl:attribute><Esc>F<i
inorea <buffer> msg__IABBREV <xsl:message></xsl:message><Esc>F<i
inorea <buffer> sel__IABBREV select=""<Left>
"inorea <buffer> eq__IABBREV =""<Left><Left><Left><BS><Right><Right>
inorea <buffer> excl__IABBREV exclude-result-prefixes="exslt func dyn str"
inorea <buffer> exslt__IABBREV xmlns:exslt="http://exslt.org/common"
inorea <buffer> func__IABBREV xmlns:func="http://exslt.org/functions"
inorea <buffer> dyn__IABBREV xmlns:dyn="http://exslt.org/dynamic"
inorea <buffer> str__IABBREV xmlns:str="http://exslt.org/strings"

