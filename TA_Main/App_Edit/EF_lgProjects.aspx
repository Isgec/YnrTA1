<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_lgProjects.aspx.vb" Inherits="EF_lgProjects" title="Edit: Projects" %>
<asp:Content ID="CPHlgProjects" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="page">
<asp:UpdatePanel ID="UPNLlgProjects" runat="server" >
<ContentTemplate>
  <asp:Label ID="LabellgProjects" runat="server" Text="&nbsp;Edit: Projects" Width="100%" CssClass="sis_formheading"></asp:Label>
  <LGM:ToolBar0 
    ID = "TBLlgProjects"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    EnablePrint = "false"
    ValidationGroup = "lgProjects"
    Skin = "tbl_blue"
    runat = "server" />
<asp:FormView ID="FVlgProjects"
	runat = "server"
	DataKeyNames = "ProjectID"
	DataSourceID = "ODSlgProjects"
	DefaultMode = "Edit" CssClass="sis_formview">
	<EditItemTemplate>
    <br />
		<table>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ProjectID" runat="server" ForeColor="#CC6633" Text="ProjectID :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_ProjectID"
						Text='<%# Bind("ProjectID") %>'
            ToolTip="Value of ProjectID."
            Enabled = "False"
						CssClass = "mypktxt"
            Width="140px"
						runat="server" />
				</td>
			</tr>
			<tr>
				<td class="alignright">
					<b><asp:Label ID="L_ProjectDescription" runat="server" Text="Project Description :" /></b>
				</td>
				<td>
					<asp:TextBox ID="F_ProjectDescription"
						Text='<%# Bind("Description") %>'
            Width="350px" Height="40px" TextMode="MultiLine"
						CssClass = "mytxt"
						onfocus = "return this.select();"
						ValidationGroup="lgProjects"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for Project Description."
						MaxLength="100"
						runat="server" />
					<asp:RequiredFieldValidator 
						ID = "RFVProjectDescription"
						runat = "server"
						ControlToValidate = "F_ProjectDescription"
						Text = "Project Description is required."
						ErrorMessage = "[Required!]"
						Display = "Dynamic"
						EnableClientScript = "true"
						ValidationGroup = "lgProjects"
						SetFocusOnError="true" />
				</td>
			</tr>
		</table>
	<br />
	</EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODSlgProjects"
  DataObjectTypeName = "SIS.QCM.qcmProjects"
  SelectMethod = "qcmProjectsGetByID"
  UpdateMethod="qcmProjectsUpdate"
  DeleteMethod="qcmProjectsDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.QCM.qcmProjects"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="ProjectID" Name="ProjectID" Type="String" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</asp:Content>
