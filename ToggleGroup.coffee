# ToggleGroup.coffee
# by Eric Kramp
# https://github.com/EricKramp/framer-toggle-group

# Add the following line to your project in Framer Studio. 
# toggleGroup = require "ToggleGroup"
# Reference the contents by name, like toggleGroup.addToggle() or addToggle.myVar

class ToggleGroup extends Layer
	constructor: (@options={}) ->
		@options.members = {}
		super @options

	# don't need "parent"
	@addToggle: (newToggle, callback) ->
		newToggle.callback = callback
		newToggle.onClick ->
			@.callback(@)
			loopGroup(@.parent, @)
			

	loopGroup = (group, selected) ->
		for toggle in group.children
			if toggle == selected
				# toggle.animate("selected")
				cycleStates(toggle)
			else
				if toggle.states.current.name == "selected"
					# toggle.animate("default")
					cycleStates(toggle)

	cycleStates = (obj) ->
		obj.stateCycle()
		for i in obj.stateAffected
			i.stateCycle()



module.exports = ToggleGroup