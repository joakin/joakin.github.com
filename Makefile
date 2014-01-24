.PHONY : default watch preview
default:
	lessc css/style.less css/style.css
	jekyll build
	# mkdir -p css
	# ./node_modules/stylus/bin/stylus stylus/main.styl --use ./node_modules/nib/lib/nib --watch --out css
preview:
	jekyll serve --watch
watch:
	stylus css/stylus/style.styl --use ./node_modules/nib/lib/nib --watch --out css

