<%= link_to t(".sign_up"), sign_up_path, :class => "button" %>

<h1>Welcome#index</h1>
<p>Find me in app/views/welcome/index.html.erb</p>

<button type="button" class="btn btn-default"><a href="vehicle/new">Create a new vehicle for rent</a></button>
<button type="button" class="btn btn-primary"><a href="vehicles">See the vehicles for rent</a></button>

<% if current_user %>
	<%= link_to "My Profile Page", user_path(current_user.id), :class => "btn btn-primary" %>
<% end %>



<div class="row mt pt">
  <div class="large-5 columns">
    <div class="top-pad glassy-bg">
      <%= render partial: "vehicles/new" %>
    </div>
  </div>
 	<div class= "large-7 columns" id="vehicles">
    <%= render partial: @vehicles.reverse %>
  </div>
</div>