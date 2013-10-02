module Seeders
  module Logos

    class << self

      def seed
        logos.each do |attributes|
          # binding.pry
          logo = Logo.where(title: attributes[:title]).first
          if logo.nil?
            logo = Logo.new
            logo.title = attributes[:title]
            image = File.open(File.join(Rails.root, attributes[:logo]))
            logo.logo = image
          else
            logo.update_attributes(attributes)
          end
          logo.save!
        end
      end

      def logos
        [
          {
            title: "AIG",
            logo: "/app/assets/images/aig.gif"
          },
          {
            title: "altria",
            logo: "/app/assets/images/altria.gif"
          },
          {
            title: "Berkshire Hathaway",
            logo: "/app/assets/images/berkshirehathaway.gif"
          },
          {
            title: "Chevron",
            logo: "/app/assets/images/chevron.jpg"
          },
          {
            title: "Citi Group",
            logo: "/app/assets/images/citigroup.gif"
          },
          {
            title: "Conoco Phillips",
            logo: "/app/assets/images/conocophillips.gif"
          },
          {
            title: "Exxon",
            logo: "/app/assets/images/exxon.jpg"
          },
          {
            title: "Ford",
            logo: "/app/assets/images/ford.gif"
          },
          {
            title: "General Electric",
            logo: "/app/assets/images/general_electric.jpg"
          },
          {
            title: "General Motors",
            logo: "/app/assets/images/general_motors.gif"
          },
          {
            title: "Home Depots",
            logo: "/app/assets/images/homedepot.gif"
          },
          {
            title: "HP",
            logo: "/app/assets/images/hp.jpg"
          },
          {
            title: "IBM",
            logo: "/app/assets/images/ibm.jpg"
          },
          {
            title: "Verizon",
            logo: "/app/assets/images/verizon.gif"
          },
          {
            title: "Walmart",
            logo: "/app/assets/images/walmart.gif"
          },
        ]
      end

    end
  end
end
