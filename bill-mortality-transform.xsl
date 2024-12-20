<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
       
    <!-- need to look up example of xsl:result-document -->
    <xsl:template match="/">
        
        <html>
            <head>
                <title>Bill of Mortality</title>
                <link rel="stylesheet" href="../bills-mortality.css"/>
            </head>
            <body>
                <h3>London: Week <xsl:value-of select=".//data(@week)"/>, Week beginning 
                <xsl:value-of select=".//data(@date-from)"/></h3>
                <hr/>
                <h2>Parishes Within the Walls</h2>
                <table>
                    <tr><th>Parish</th><th>Bur.</th><th>Plag.</th></tr>
                    <xsl:for-each select=".//parishes[data(@loc)='within-the-walls']/parish">
                        <tr>
                            <td><xsl:apply-templates select="data(@name)!replace(., '-', ' ')"/></td>
                            <td><xsl:apply-templates select="data(@bur)"/></td>
                            <td><xsl:apply-templates select="data(@plag)"/> </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h3>Total Burials: <xsl:apply-templates select="descendant::parishes[@loc='within-the-walls']/burials/data(@total)"/>
                    Of which Plague: <xsl:apply-templates select="descendant::parishes[@loc='within-the-walls']/burials/data(@plague)"/></h3>
                <hr/>
            </body>
            </html>
        
    </xsl:template>
    
    <xsl:template match="week">
        <h1>London: Week <xsl:apply-templates select="data(@n)"/> Beginning <xsl:apply-templates select="data(@date-from)"/></h1>
    </xsl:template>
    
</xsl:stylesheet>