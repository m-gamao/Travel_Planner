Manual way to link_to:
<%= link_to "Add notes", "/destinations/#{@destination.id}/notes/#{@note.id}/new", method: :new %> 

____________________________________

# TODO
1. Provide an option to the user to view the last 3 notes for a
specific destination in mind.
2. Search for all destinations that have notes attached to them.

QUERY Parameter
Routes Parameter

Destination.create!([{
  user_id: "1",  
  name: "Interlaken",
  description: "scenic mountains, lakes, great for hiking, anything outdoors",
  location: "Switzerland",
},
{
  user_id: "2",
  name: "Geiranger Fjord",
  description: "Norway's most famous fjord",
  location: "Norway",
},
{ 
  user_id: "3",
  name: "Barcelona",
  description: "historic town for art and architecture",
  location: "Spain",
},
{
  user_id: "4",
  name: "Tuscany",
  description: "scenic countryside with farming villages; good hiking and biking trails",
  location: "Italy",
},
{
  user_id: "5",
  name: "Buckingham Palace",
  description: "where the royal family lives",
  location: "London",
},
{
  user_id: "6",
  name: "Eiffel Tower",
  description: "landmark",
  location: "Paris, France",
}])

p "Created #{Destination.count} destinations"