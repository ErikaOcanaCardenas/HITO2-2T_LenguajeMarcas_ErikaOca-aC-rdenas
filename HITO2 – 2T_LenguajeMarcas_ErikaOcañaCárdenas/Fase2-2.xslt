<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Información de Clientes</title>
      </head>
      <body>
        <h1>Información de Clientes</h1>
        <table border="1">
             <tr>
            <th>Nombre</th>
            <th>Apellidos</th>
            <th>Telefono</th>
            <th>Calle</th>
            <th>Ciudad</th>
            <th>Codigo Postal</th>
            <th>Provincia</th>
          </tr>
          <xsl:apply-templates select="//pedido"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="pedido">
      <tr>
      <td><xsl:value-of select="cliente/nombre"/></td>
      <td><xsl:value-of select="cliente/apellidos"/></td>
      <td><xsl:value-of select="cliente/telefono"/></td>
      <td><xsl:value-of select="cliente/direccion/calle"/></td>
      <td><xsl:value-of select="cliente/direccion/ciudad"/></td>
      <td><xsl:value-of select="cliente/direccion/codigoPostal"/></td>
      <td><xsl:value-of select="cliente/direccion/provincia"/></td>
    </tr>
r>
  </xsl:template>
</xsl:stylesheet>