<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<% include Header %>
<% include NavigationCart %>
<div class = "all-product-page container">
    <div class = "row">
        <%-- <div class = "col-lg-4 mw-100">
            <div class = "search-form">
                $ProductSearchForm
                <% if $ActiveFilters %>
                    <p>Searching
                        <% loop $ActiveFilters %>
                            <% if $Label %>
                                for $Label 
                            <% end_if %>
                            <% if $Category %>
                                in $Category's category
                            <% end_if %>
                        <% end_loop %>
                    </p>
                <% end_if %>
            </div>
            <div style="left: -50%;">
            </div>
        </div> --%>
        <div class = "mw-100">
            <div class = "search-results">
                <% include AllProductResult %>
            </div>
        </div>
    </div>
        <% include Pagination %>
</div>
<% include Contact %>
<% include Footer %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>