<%= form_for(@calorie_consumption) do |f| %>
  <% if @calorie_consumption.errors.any? %>
    <div id="error_explanation">
    <h2><%= pluralize(@calorie_consumption.errors.count, "error") %> prohibited this calorie_consumption from being saved:</h2>

    <ul>
    <% @calorie_consumption.errors.full_messages.each do |message| %>
      <li><%= message %></li>
      <% end %>
      </ul>
      </div>
      <% end %>

      <div class="field">
      <%= f.label :consumed_on %><br>
      <%= f.datetime_select :consumed_on %>
      </div>
      <div class="field">
      <%= f.label :food %><br>
      <%= f.text_field :food %>
      </div>
      <div class="field">
      <%= f.label :calorie_intake %><br>
      <%= f.number_field :calorie_intake %>
      </div>
      <div class="actions">
      <%= f.submit %>
      </div>
      <% end %>
      
