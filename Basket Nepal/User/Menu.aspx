<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Foodie.User.Menu" %>
<%@ Import Namespace="Foodie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- food section -->

	<!-- products -->
	<div class="product-section mt-150 mb-150">
		<div class="container">
            <div class="heading_container heading_center">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <h2>Our Menu
                </h2>
            </div>
        
			<div class="row">
               <div class="col-md-12">
                    <div class="product-filters">
            <ul>
                <li class="active" data-filter="*" data-id="0">All</li>
                <asp:Repeater ID="rCategory" runat="server">
                    <ItemTemplate>
                         <li data-filter=".<%# Regex.Replace(Eval("Name").ToString().ToLower(),@"\s+","") %>"
                             data-id="<%# Eval("CategoryId") %>"><%#Eval("Name") %></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            </div>
            </div>
            </div>

			<div class="row product-lists">
                    <asp:Repeater ID="rProducts" runat="server" OnItemCommand="rProducts_ItemCommand">
                        <ItemTemplate>
                             <div class="col-lg-4 col-md-6 text-center <%# Regex.Replace(Eval("CategoryName").ToString().ToLower(),@"\s+","") %>">
                    <%--<div class="col-lg-4 col-md-6 text-center">--%>
					<div class="single-product-item">
                                       <div class="product-image">
                                            <img src="<%# Utils.GetImageUrl( Eval("ImageUrl"))%>" alt="">
                                        </div>
                                       
                                            <h3><%# Eval("Name") %></h3>
                                            <p>
                                              <%# Eval("Description")%>
                                            </p>
                                            <div class="options">
                                                <p>$<%# Eval("Price")%></p>
                                                <asp:LinkButton runat="server" ID="lbAddToCart" class="cart-btn" CommandName="addToCart"
                                                    CommandArgument='<%# Eval("ProductId")%>'>
                                                    <i class="fas fa-shopping-cart"></i>Add to Cart
                                                </asp:LinkButton>
                                            </div>
                                      
                                    </div>
                                </div>
                            
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
     </div>



    <!-- end food section -->
</asp:Content>
