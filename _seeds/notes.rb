#########################
# (Tasting) notes w/ ratings

richard = [
[ 'fullerslondonpride', 8,
    'Biertemparatur im Pub etwas zu kalt. + Bier im passenden Glas (Fuller Etikette) serviert',
    "O'Connors" ],
[ 'kilkenny', 5 ]]


gerald = [
[ 'zwettlerzwickl', 8,
  "Erfrischend. Hausbier im Frank's. Am besten mit Chiliburger dazu. Prost.",
  "Frank's" ],
[ 'schlaeglabteipils', 8,
  'Erstes Bier nach Bueroschluss. Wahnsinn. Prost. Besser ein Kruegerl beim naechsten Mal und kein Seidl.' ],
[ 'freistaedterrattsherrn', 7,
  'Schmeckt. Leider, das Seidl als Probe zu klein.'
]]


franz = [
[ 'zwettlerexportlager', 8,
  'Ein Bier für die meisten aller Lebenssituationen',
  'Dahoam' ],
[ 'ottakringerhelles', 8,
  'Ähnlich wie ein Zwettler, passt beinahe zu jeder "Lebensmesse"' ],
# [ 'millergenuinedraft', 9,
#  'Ein süffiges Bier',
#  'Belfast' ],
[ 'zipfermaerzen', 9,
  'Eigentlich nicht das "beste" Bier + ABER niemals werde ich den Heimflug aus IBIZA vergessen... 10 Tage san miguel (Wertung: 3), das mir zum Hals raushing, und im AUA Flugzeug das erste österreichische Bier, und so ein Zipfer schmeckte nie so gut wie diese eine Dose',
  'AUA Flug, IBIZA - Wien 1997' ],
[ 'zwettleroriginal', 6,
  'Geschmacklich gut - zu viel Kohlensäure',
  'Zwettl' ],
[ 'zwettlerkuenringerfestbock', 5,
  'Typisches Maurerbier',
  'Kottingbrunn' ],
[ 'corona', 8,
  'Bier das sich fast immer trinken lässt... Fast so wie Wasser, das man von der Wiege bis zur Bare immer trinken kann' ]]

manfred = [
[ 'fullerslondonpride', 8 ]]

didi = [
[ 'fullerslondonpride', 10,
  'Süffig mit malzigem Abgang ;-)',
  'Pub der Fuller Brewery' ],
[ 'weitrahelles', 7,
  'Gut gekühlt getrunken',
  'Daheim' ],
[ 'fullersesb', 3,
  'Schaler Abgang, Feudel'
]]

markus = [
[ 'fullersesb', 10, 'the best Beeeeeeer ever' ]]

andreas = [
[ 'fullerslondonpride', 8 ],
[  'murphysred', 8, 'Würzig, süsslich' ]]




### todo: move helper to Note class/model - why, why not??
def self.note_create_for!( user_key, data )
  puts "loading notes for #{user_key}..."
  user = User.find_by_key!( user_key )

  data.each do |rec|
    beer_key     = rec[0]
    rating       = rec[1].to_i
    comments     = rec[2]
    place        = rec[3]
    
    # beer = Beer.find_by_key( beer_key )
    beer = Beer.find_by_key!( beer_key )

    if beer.present?

       note = Note.new
       attribs = {
          user_id:   user.id,
          beer_id:   beer.id,
          rating:    rating,   # 1-10 scala (10 is best)
          comments:  comments,
          place:     place
       }
       note.update_attributes!( attribs )

    else
      puts "**** warn: beer w/ key '#{beer_key}' missing !!!!!!!"
    end
  end
end


note_create_for!( 'richard', richard )
note_create_for!( 'gerald',  gerald  )
note_create_for!( 'franz',  franz  )
note_create_for!( 'manfred',  manfred  )
note_create_for!( 'didi',  didi  )
note_create_for!( 'markus',  markus  )
note_create_for!( 'andreas',  andreas  )
