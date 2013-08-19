
# Watch stylus file for changes and recompile
.PHONY : default
default:
	lessc css/style.less css/style.css
	jekyll build
	# mkdir -p css
	# ./node_modules/stylus/bin/stylus stylus/main.styl --use ./node_modules/nib/lib/nib --watch --out css

