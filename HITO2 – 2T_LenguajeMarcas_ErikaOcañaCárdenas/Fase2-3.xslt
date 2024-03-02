<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  
  <xsl:key name="clientes" match="cliente" use="concat(nombre, '|', apellidos)"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Factura</title>
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
        <h1>Factura</h1>
        <xsl:apply-templates select="//cliente[generate-id() = generate-id(key('clientes', concat(nombre, '|', apellidos))[1])][1]"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="cliente">
    <h2>
      <xsl:value-of select="concat(nombre, ' ', apellidos)"/>
    </h2>
    <h3>Dirección de Envío:</h3>
    <p>
      <xsl:value-of select="direccion/calle"/>, <xsl:value-of select="direccion/ciudad"/>,
      <xsl:value-of select="direccion/provincia"/> - <xsl:value-of select="direccion/codigoPostal"/>
    </p>
    <table>
      <tr>
        <th>Producto</th>
        <th>Referencia</th>
        <th>Precio Unitario</th>
        <th>Unidades</th>
        <th>Total</th>
      </tr>
      <xsl:apply-templates select="detallePedido/producto/pedido"/>
    </table>
  </xsl:template>

  <xsl:template match="pedido">
    <tr>
      <td><xsl:value-of select="detallePedido/producto/nombre"/></td>
      <td><xsl:value-of select="detallePedido/producto/referencia"/></td>
      <td><xsl:value-of select="detallePedido/producto/precio"/></td>
      <td><xsl:value-of select="detallePedido/producto/unidades"/></td>
      <td><xsl:value-of select="pedido/detallePedido/totalFactura"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>

