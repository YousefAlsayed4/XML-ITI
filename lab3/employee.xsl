<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <style type="text/css">
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h1>Employee Directory</h1>
        <table>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone Numbers</th>
            <th>Addresses</th>
          </tr>
          <xsl:apply-templates select="employees/employee"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="employee">
    <tr>
      <td><xsl:value-of select="name"/></td>
      <td><xsl:value-of select="email"/></td>
      <td>
        <ul>
          <xsl:apply-templates select="phones/phone"/>
        </ul>
      </td>
      <td>
        <ul>
          <xsl:apply-templates select="addresses/address"/>
        </ul>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="phone">
    <li><xsl:value-of select="."/></li>
  </xsl:template>

  <xsl:template match="address">
    <li>
      <xsl:value-of select="building_number"/> <xsl:value-of select="street"/>, <xsl:value-of select="city"/>, <xsl:value-of select="region"/>, <xsl:value-of select="country"/>
    </li>
  </xsl:template>
</xsl:stylesheet>