<% with  $Results %>
    <% if $MoreThanOnePage %>
        <ul class="pagination"  style=" display: flex; gap: 15px;">
            <% if $NotFirstPage %>
                <li class="page-item" style="list-style-type: none; ">
                    <a class="page-link previous bg-dark text-white" aria-label="Previous" href="$PrevLink">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            <% end_if %>
    
            <% loop $PaginationSummary(4) %>
                <li class="page-item <% if not $Link || $CurrentBool %>disabled<% end_if %>" style="list-style-type: none;">
                    <% if $Link %>
                        <a class="page-link<% if $CurrentBool %> bg-dark<% else %> bg-secondary<% end_if %> text-white"
                           href="$Link">$PageNum</a>
                    <% else %>
                        <span class="bg-secondary text-white">...</span>
                    <% end_if %>
                </li>
            <% end_loop %>
    
            <% if $NotLastPage %>
                <li class="page-item" style="list-style-type: none;">
                    <a class="page-link next bg-dark text-white" href="$NextLink" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            <% end_if %>
        </ul>
    <% end_if %>
<% end_with %>