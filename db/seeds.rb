styles_list = {
  "Amercian Amber Ale" => {
      :description => "The American amber ale has medium-high to high maltiness with medium to low caramel character. They are characterized by American-variety hops, which produce medium hop bitterness, flavor and aroma. American ambers are usually darker in color, have more caramel flavor and less hop aromatics, and may have more body. This style was first made popular by brewers from California and the Pacific Northwest."
    },
    "American Pale Ale" => {
      :description => "An American interpretation of a classic English style. The American pale ale is characterized by floral, fruity, citrus-like, piney, resinous, or sulfur-like American-variety hop character, producing medium to medium-high hop bitterness, flavor and aroma. American-style pale ales have medium body and low to medium maltiness that may include low caramel malt character."
    },
    "American IPA" => {
      :description => "Characterized by floral, fruity, citrus-like, piney or resinous American-variety hop character, the IPA beer style is all about hop flavor, aroma and bitterness. This has been the most-entered category at the Great American Beer Festival for more than a decade, and is the top-selling craft beer style in supermarkets and liquor stores across the U.S."
    },
    "English IPA" => {
      :description => "Steeped in lore (and extra hops), the IPA is a stronger version of a pale ale. The English-style IPA is characterized by stiff English-style hop character (earthy, floral) and increased alcohol content. English yeast lends a fruity flavor and aroma. Different from its American counterpart, this style strikes a balance between malt and hops for a more rounded flavor. There is also a lot of mythology surrounding the creation of this style, which is still debated today."
    },
    "American Porter" => {
      :description => "Inspired from the now wavering English Porter, the American Porter is the ingenuous creation from that. Thankfully with lots of innovation and originality American brewers have taken this style to a new level. Whether it is highly hopping the brew, using smoked malts, or adding coffee or chocolate to complement the burnt flavor associated with this style. Some are even barrel aged in Bourbon or whiskey barrels. The hop bitterness range is quite wide but most are balanced. Many are just easy drinking session porters as well. "
    },
    "English Porter" => {
      :description => "The English-style brown porter has no roasted barley or strong burnt/black malt character. Low to medium malt sweetness, caramel and chocolate is acceptable. Hop bitterness is medium. Softer, sweeter and more caramel-like than a robust porter, with less alcohol and body. Porters are the precursor style to stouts."
    },
    "American Stout" => {
      :description => "The American stout is a coffee- and chocolate-forward ale, but with a hop aroma and flavor, often from a citrus-forward variety. American stouts are bold, with a distinctive dry-roasted bitterness in the finish. Fruity esters should be low, but head retention high. The addition of oatmeal is acceptable in this style and lends to the body and head retention."
    },
    "American Wheat" => {
      :description => "Color is pale to light amber. This beer can be made using either ale or lager yeast. American wheat beer is generally brewed with at least 30 percent malted wheat. These beers are typically served with the yeast in the bottle, and pour cloudy. Traditionally more hoppy than a German hefeweizen, American wheat beer differs in that it should not offer flavors of banana or clove. It is a refreshing summer style. Darker versions of this style also exist but are not as common."
    },
    "Kölsch" => {
      :description => "First only brewed in Köln, Germany, now many American brewpubs and a hand full of breweries have created their own version of this obscure style. Light to medium in body with a very pale color, hop bitterness is medium to slightly assertive. A somewhat vinous (grape-y from malts) and dry flavor make up the rest."
    },
    "Witbier" => {
      :description => "A Belgian Style ale that's very pale and cloudy in appearance due to it being unfiltered and the high level of wheat, and sometimes oats, that's used in the mash. Always spiced, generally with coriander, orange peel and other oddball spices or herbs in the back ground. The crispness and slight twang comes from the wheat and the lively level of carbonation. This is one style that many brewers in the US have taken a liking to and have done a very good job of staying to style. Sometimes served with a lemon, but if you truly want to enjoy the untainted subtleties of this style you'll ask for yours without one. Often referred to as 'white beers' (witbieren) due to the cloudiness / yeast in suspension."
    },
    "Hefeweizen" => {
      :description => "A south German style of wheat beer (weissbier) made with a typical ratio of 50:50, or even higher, wheat. A yeast that produces a unique phenolic flavors of banana and cloves with an often dry and tart edge, some spiciness, bubblegum or notes of apples. Little hop bitterness, and a moderate level of alcohol. The \"Hefe\" prefix means \"with yeast\", hence the beers unfiltered and cloudy appearance. Poured into a traditional Weizen glass, the Hefeweizen can be one sexy looking beer.

      Often served with a lemon wedge (popularized by Americans), to either cut the wheat or yeast edge, which many either find to be a flavorful snap ... or an insult and something that damages the beer's taste and head retention."
    }

}

styles_list.each do |name, style_hash|
  b = Style.new
  b.name = name
  style_hash.each do |attribute, value|
    b[attribute] = value
  end
  b.save
end

breweries_list = {
    "New Belgium Brewing Company" => {
      :country => "United States"
    },
    "Sierra Nevada Brewing Co." => {
      :country => "United States"
    },
    "Dogfish Head Craft Brewery" => {
      :country => "United States"
    },
    "Lagunitas Brewing Company" => {
      :country => "United States"
    },
    "Mac & Jack's Brewing Company" => {
      :country => "United States"
    },
    "Cervecería Minerva" => {
      :country => "Mexico"
    },

}

breweries_list.each do |name, brewery_hash|
  b = Brewery.new
  b.name = name
  brewery_hash.each do |attribute, value|
    b[attribute] = value
  end
  b.save
end
