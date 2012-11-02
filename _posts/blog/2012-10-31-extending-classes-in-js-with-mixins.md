
---
layout: post
category: post
title: Extending classes in js using mixins
comments: true
tags:
  - js
  - programming
---

There are times when we have different classes that share a certain behaviour
but they do not have a common ancestor.

Taking advantage of JS prototypal inheritance, we can make them share
code/behaviour and avoid duplication .

### Example case

Imagine we have two random *types*

    var Person = function (name) {
        this.name = name;
    };

    var Car = function (brand, model, year) {
        this.brand = brand;
        this.model = model;
        this.year = year;
    };

If we wanted make both Persons and Cars blow up, we would have to create
a super class (not a good idea since this two types do not have anything we
want in common) or implement the behaviour in both classes (code duplication).

### A solution using mixins

The solution we are going to explore is Mixins. A mixin is a standalone piece of
functionality or behaviour. It has to exist in a object form, so that it can be
used later to extend other types prototypes.

For example, for the explode exercise:

If we use what we will call a mixin, then we get what we wanted. If we define
the explode functionality as a standalone mixin:

    var ExplodeMixin = {
        blown: null,
        blowUp: function() {
            if (this.blown === null) {
                console.log('KaBoww');
                this.blown = (new Date()).getTime();
            } else {
                console.log('Already blown up');
            }
        }
    };

Then we could extend our types with this behaviour without duplicating code or
creating a common ancestor. For it, we are going to use a function called extend, that
basically extends a object with another one. Check the underscorejs docs for
example -> [_.extend](http://underscorejs.org/#extend)

    var Person = function (name) {
        this.name = name;
    };
    _.extend(Person.prototype, ExplodeMixin);

    var Car = function (brand, model, year) {
        this.brand = brand;
        this.model = model;
        this.year = year;
    };
    _.extend(Car.prototype, ExplodeMixin);

After this, we can safely do:

    var john = new Person('John');
    john.blowUp();

`KaBoww`

    var golf = new Car('VolsWagen', 'Golf', 2012);
    golf.blowUp();

`KaBoww`

### Using it with Backbone

The case we found for using this pattern was for example, when among multiple
views you want to have a certain behaviour shared, like in our case with
putting a view in a loading state.

So our real example looks like this:

**views/mixins/loading.js**
    var LoadingMixin = {
        loadingOverlayTemplate: require('views/templates/loading_overlay'),
        
        isLoading: false,
        
        setLoading: function(yes) {
            if (yes) {
                if (!this.isLoading) {
                    this.isLoading = true;
                    $(this.el).html(this.loadingOverlayTemplate());
                }
            } else {
                if (this.isLoading) {
                    this.isLoading = false;
                    this.$('.flOverlay').remove();
                }
            }
        }
    };
    
    module.exports = LoadingMixin;

**views/communication_actions.js**
    var LoadingMixin = require('views/mixins/loading')
    
    var CommunicationActionsView = CommunicationView.extend({
        
        /*
         * Code for the view here.
         */
        
        formSubmit: function() {
            
            // Method of the loading mixin
            this.setLoading(true);
            
            // More stuff
        }
    });
    
    _.extend(CommunicationActionsView.prototype, LoadingMixin);
    
    module.exports = CommunicationModalStep1View;
    

This way, you can share behaviours or code among certain types as you want.

