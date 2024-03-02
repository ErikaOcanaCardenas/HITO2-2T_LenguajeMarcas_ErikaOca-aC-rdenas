<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Productos Vendidos</title>
        <style>
          table {
            border-collapse: collapse;
            width: 100%;
          }
          th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
          }
        </style>
      </head>
      <body>
        <h1>Productos Vendidos</h1>
        <h2>Primer Trimestre de 2020</h2>
        <table>
          <tr>
            <th>Producto</th>
            <th>Referencia</th>
            <th>Precio Unitario</th>
            <th>Unidades</th>
            <th>Total</th>
          </tr>
          <xsl:apply-templates select="//trimestre[@trimestre='1']/pedido/productos/producto"/>
        </table>

        <h2>Último Trimestre de 2021</h2>
        <table>
          <tr>
            <th>Producto</th>
            <th>Referencia</th>
            <th>Precio Unitario</th>
            <th>Unidades</th>
            <th>Total</th>
          </tr>
          <xsl:apply-templates select="//trimestre[@trimestre='4']/pedido/productos/producto"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="producto">
    <tr>
      <td><xsl:value-of select="nombre"/></td>
      <td><xsl:value-of select="referencia"/></td>
      <td><xsl:value-of select="precio"/></td>
      <td><xsl:value-of select="unidades"/></td>
      <td><xsl:value-of select="precio * unidades"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
