<?xml version='1.0' encoding='UTF-8'?>
<!-- MINDMAPEXPORTFILTER xml TestLink test case
====================================================================================================
  @date 2007/11/01
  @version 1.1
  @author Toshiyuki Kawanishi

  @license GPL (http://www.gnu.org/copyleft/gpl.html)
==================================================================================================== -->

<xsl:stylesheet version='1.0'
 xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

  <!-- ##### Set the level of categories' depth. ##### -->
  <xsl:param name='category_depth' select='2'/>
  <!-- ############################################### -->

  <xsl:output method='xml' indent='yes' encoding='UTF-8'/>

  <xsl:template match='/'>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match='/map/node'>
    <testsuite>
    <xsl:attribute name="name"></xsl:attribute>
    <details>
      <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text>
      <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
    </details>

    <xsl:apply-templates mode='contents'>
      <xsl:with-param name='depth' select='1'/>
    </xsl:apply-templates>

    </testsuite>
  </xsl:template>

  <xsl:template match='node' mode='contents'>
    <xsl:param name='depth'/>
    <xsl:param name='starting_index'/>
    <xsl:param name='index_of_components'/>

    <xsl:if test='$depth &lt;= $category_depth'>
      <testsuite>
      <xsl:attribute name="name"><xsl:value-of select='@TEXT'/></xsl:attribute>
      <details>
        <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text>This Test Suite is made from Mind Map.<xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
      </details>

      <xsl:apply-templates mode='contents'>
        <xsl:with-param name='depth' select='$depth + 1'/>
      </xsl:apply-templates>

      </testsuite>
    </xsl:if>

    <xsl:if test='$depth = $category_depth + 1'>
      <testcase>
      <xsl:attribute name="name"><xsl:value-of select='@TEXT'/></xsl:attribute>
      <xsl:choose>
        <xsl:when test='position() &gt;= 4'>
          <xsl:apply-templates mode='contents'>
            <xsl:with-param name='depth' select='$depth + 1'/>
            <xsl:with-param name='starting_index' select='0'/>
          </xsl:apply-templates>
        </xsl:when>

        <xsl:otherwise>
          <xsl:apply-templates mode='contents'>
            <xsl:with-param name='depth' select='$depth + 1'/>
            <xsl:with-param name='starting_index' select='1'/>
          </xsl:apply-templates>
        </xsl:otherwise>
      </xsl:choose>

      </testcase>
    </xsl:if>

    <xsl:if test='$depth = $category_depth + 2'>
      <xsl:variable name='index' select='count(preceding-sibling::node) + 1 - $starting_index'/>
      <xsl:choose>
        <xsl:when test='$index = 1'>
          <summary>
            <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text>
            <p><xsl:value-of select='@TEXT'/></p>
            <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
          </summary>
        </xsl:when>

        <xsl:when test='$index = 2'>
          <steps>
            <xsl:text disable-output-escaping='yes'>&lt;![CDATA[
&lt;ol&gt;</xsl:text>
            <xsl:apply-templates mode='contents'>
              <xsl:with-param name='depth' select='$depth + 1'/>
              <xsl:with-param name='index_of_components' select='$index'/>
            </xsl:apply-templates>
            <xsl:text disable-output-escaping='yes'>&lt;/ol&gt;
]]&gt;</xsl:text>
          </steps>
        </xsl:when>

        <xsl:when test='$index = 3'>
          <expectedresults>
            <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text>
            <p><xsl:value-of select='@TEXT'/></p>
            <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
          </expectedresults>
        </xsl:when>
        <xsl:when test='$index = 4'>
          <keywords>
            <xsl:apply-templates mode='contents'>
              <xsl:with-param name='depth' select='$depth + 1'/>
              <xsl:with-param name='index_of_components' select='$index'/>
            </xsl:apply-templates>
          </keywords>
        </xsl:when>
      </xsl:choose>

    </xsl:if>

    <xsl:if test='$depth = $category_depth + 3'>
      <xsl:choose>
        <xsl:when test='$index_of_components = 2'>
          <li><xsl:value-of select='@TEXT'/></li>
        </xsl:when>

        <xsl:when test='$index_of_components = 4'>
          <keyword>
            <xsl:attribute name="name"><xsl:value-of select='@TEXT'/></xsl:attribute>
            <xsl:apply-templates mode='contents'>
              <xsl:with-param name='depth' select='$depth + 1'/>
            </xsl:apply-templates>
          </keyword>
        </xsl:when>
      </xsl:choose>
    </xsl:if>

    <xsl:if test='$depth = $category_depth + 4'>
      <notes>
        <xsl:text disable-output-escaping='yes'>&lt;![CDATA[</xsl:text>
        <xsl:text disable-output-escaping='yes'><xsl:value-of select='@TEXT'/></xsl:text>
        <xsl:text disable-output-escaping='yes'>]]&gt;</xsl:text>
      </notes>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
