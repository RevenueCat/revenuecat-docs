var lang = Locale.getDefault().displayLanguage

var localizedCopy = offerings.current?.getMetadataString(lang, "Go premium!")

root.findViewById<TextView>(R.id.description).text = localizedCopy
