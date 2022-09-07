<%@ Page Language="C#" %>

<!Doctype html>
<html>
    <head runat="server">
        <title>Inimeste andmed xml failist</title>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <asp:Xml runat="server" 
                    DocumentSource="~/sugupuu.xml"
                    TransformSource="~/sugupuuLisa.xslt"></asp:Xml>
            </div>
        </form>
    </body>

</html>
