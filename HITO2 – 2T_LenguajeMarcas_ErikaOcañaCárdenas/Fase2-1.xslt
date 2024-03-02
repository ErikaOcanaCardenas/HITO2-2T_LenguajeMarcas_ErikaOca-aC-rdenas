<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Información de Pedidos</title>
      </head>
      <body>
        <h1>Información de Pedidos</h1>
        <table border="1">
          <tr>
            <th>Número de Pedido</th>
            <th>Nombre del Cliente</th>
            <th>Fecha de Compra</th>
            <th>Fecha de Entrega</th>
            <th>Total Factura</th>
          </tr>
          <xsl:apply-templates select="//pedido"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="pedido">
    <tr>
      <td><xsl:value-of select="detallePedido/numeroPedido"/></td>
      <td><xsl:value-of select="cliente/nombre"/></td>
      <td><xsl:value-of select="detallePedido/fechaCompra"/></td>
      <td><xsl:value-of select="detallePedido/fechaEntrega"/></td>
      <td><xsl:value-of select="detallePedido/totalFactura"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>