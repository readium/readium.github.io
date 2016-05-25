<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TestResultsWeb2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Readium Test Results</title>
    <link rel="shortcut icon" type="image/png"
        href="images/favicon.ico" />

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="row">
        <div id="normal_div">
            <p><a href="http://www.readium.org">
                <img src="http://readium.github.io/test-results/images/ReadiumLogo.png" alt="Readium Logo" height="97" width="321" />
            </a></p>
            <h1>CloudReader Results</h1>
            <p>
                This page contains the results from testing of the Readium
CloudReader and Readium Chrome Extension across a large number of browsers and platforms. To download the individual test results, just click on the "Download"
link to download the Excel spreadsheet.
            </p>
        </div>
    </div>
    <div>
        <%--<asp:FileUpload ID="FileUpload1" runat="server" />
        <br/>
 
        <asp:Button ID="btnUpload" runat="server"
            Height="21px" Text="Submit"
            Width="92px" OnClick="btnUpload_Click" />--%>
        <br/>
        <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="20" OnPageIndexChanging="GridView1_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Tester" HeaderText="Tester" />
                <asp:BoundField DataField="Date" HeaderText="Date" />
                <asp:BoundField DataField="CR Version" HeaderText="CR Version" />
                <asp:BoundField DataField="Device" HeaderText="Device" />
                <asp:BoundField DataField="OS" HeaderText="OS" />
                <asp:BoundField DataField="Locale" HeaderText="Locale" />
                <asp:BoundField DataField="Browser" HeaderText="Browser" />
                <asp:BoundField DataField="Score" HeaderText="Score" />
                <asp:TemplateField HeaderText="View">
                    <ItemTemplate>
                        <a id="hl" href='<%#Eval("view") %>' target="_blank">Download</a>
                        <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("view", "{0:g}") %>'></asp:Label>--%>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerSettings PageButtonCount="5" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>
    </div>
    </form>
</body>
</html>
