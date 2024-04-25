module FindSerializerHelper
  # Custom serializer to format the data in the controller
  def self.format(data)
   {
    id: data[:id],
    name: data[:name],
    rating: data[:rating],
    distance: data[:distance]
   }
  end
end
