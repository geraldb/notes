
richard = [
[ 'murphysirishstout', { yes: true }  ],
[ 'fullersesb',        { yes: true }  ],
[ 'murphysred',        { wish: true } ],
[ 'ottakringerzwickl', { wish: true } ],
[ 'fullerslondonporter' ],
[ 'fullershoneydew' ],
[ 'fullersdiscovery' ],
[ 'fullerschiswick' ],
[ 'fullers1845' ],
[ 'fullerslondonpride' ],
[ 'smithwicks' ],
[ 'kilkenny' ],
[ 'guinness' ],
[ 'ottakringerhelles' ],
[ 'ottakringergoldfasslspezial' ],
[ 'ottakringerpils' ],
[ 'ottakringerpur' ],
[ 'ottakringerzwicklrot' ],
[ 'ottakringerdunkles' ],
[ 'ottakringerbock' ]]


gerald = [
[ 'zwettlerzwickl',    { yes: true } ],
[ 'corona',            { yes: true } ],
[ 'schlaeglabteipils', { yes: true } ],
[ 'freistaedterrattsherrn' ]]


franz = [
[ 'zwettlerexportlager', { yes: true } ],
[ 'ottakringerhelles',   { yes: true } ],
# [ 'millergenuinedraft',  { yes: true } ],
[ 'zipfermaerzen',       { yes: true } ],
[ 'zwettleroriginal' ],
[ 'zwettlerpils' ],
[ 'zwettlerzwickl' ],
[ 'zwettlerdunkles' ],
[ 'ottakringergoldfasslspezial' ],
[ 'ottakringerpils' ],
[ 'ottakringerpur' ],
[ 'ottakringerzwickl' ],
[ 'ottakringerzwicklrot' ],
[ 'ottakringerdunkles' ],
[ 'ottakringerbock' ],
[ 'zipferurtyp' ],
[ 'zwettlerkuenringerfestbock' ],
[ 'corona' ]]


manfred = [
[ 'fullerslondonpride' ], 
[ 'fullerslondonporter' ],
[ 'fullershoneydew' ],
[ 'fullersdiscovery' ],
[ 'fullerschiswick' ],
[ 'fullers1845' ],
[ 'murphysred' ],
[ 'murphysirishstout' ],
[ 'kilkenny' ],
[ 'smithwicks' ],
[ 'guinness' ]]


didi = [
[ 'fullerslondonpride', { yes: true }  ],
[ 'weitrahelles',       { yes: true }  ],
[ 'zwettleroriginal',   { yes: true }  ],
[ 'guinness' ],
[ 'fullerslondonporter' ],
[ 'fullershoneydew' ],
[ 'fullersesb' ],
[ 'fullersdiscovery' ],
[ 'fullerschiswick' ],
[ 'fullers1845' ],
[ 'zwettlerexportlager' ],
[ 'zwettlerpils' ],
[ 'zwettlerzwickl' ],
[ 'zwettlerdunkles' ],
[ 'zwettlerkuenringerfestbock' ],
[ 'hadmarbio' ],
[ 'murphysred' ],
[ 'murphysirishstout' ],
[ 'kilkenny' ],
[ 'smithwicks' ]]


markus = [
[ 'fullersesb', { yes: true } ],
[ 'fullerslondonpride' ],
[ 'fullerslondonporter' ],
[ 'fullershoneydew' ],
[ 'fullersdiscovery' ],
[ 'fullerschiswick' ],
[ 'fullers1845' ],
[ 'murphysred' ],
[ 'murphysirishstout' ],
[ 'kilkenny' ],
[ 'smithwicks' ],
[ 'guinness' ]]


andreas = [
[ 'fullerslondonpride' ],
[ 'fullerslondonporter' ],
[ 'fullershoneydew' ],
[ 'fullersdiscovery' ],
[ 'fullerschiswick' ],
[ 'fullers1845' ],
[ 'fullersesb' ],
[ 'murphysred' ],
[ 'murphysirishstout' ],
[ 'kilkenny' ],
[ 'smithwicks' ],
[ 'guinness' ]]



### todo: move helper to Bookmark class/model - why, why not??
def self.bookmark_create_for!( user_key, data )
  puts "loading bookmarks for #{user_key}..."
  user = User.find_by_key!( user_key )

  data.each do |rec|
    beer_key     = rec[0]
    more_attribs = rec[1] || {}
    
    # beer = Beer.find_by_key( beer_key )
    beer = Beer.find_by_key!( beer_key )

    if beer.present?

      bookmark = Bookmark.find_by_bookmarkable_id_and_user_id( beer.id, user.id )
      bookmark = Bookmark.new  if bookmark.nil?

      attribs = {
        user_id:           user.id,
        bookmarkable_id:   beer.id,
        bookmarkable_type: 'BeerDb::Models::Beer'  ## use Beer.class.name ?? works - why? why not? includes module namespace?
      }

      attribs = attribs.merge( more_attribs )
    
      bookmark.update_attributes!( attribs )

    else
      puts "**** warn: beer w/ key '#{beer_key}' missing !!!!!!!"
    end
  end
end


bookmark_create_for!( 'richard',  richard )
bookmark_create_for!( 'gerald',   gerald  )
bookmark_create_for!( 'franz',    franz  )
bookmark_create_for!( 'manfred',  manfred  )
bookmark_create_for!( 'didi',     didi  )
bookmark_create_for!( 'markus',   markus  )
bookmark_create_for!( 'andreas',  andreas  )
