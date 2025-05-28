# clojure-tools
Toolset for Clojure development

# Dependencies
- [https://github.com/clojure-emacs/cider](https://github.com/clojure-emacs/cider)
- [https://github.com/metosin/malli](https://github.com/metosin/malli)
- [https://github.com/AbhinavOmprakash/snitch](https://github.com/AbhinavOmprakash/snitch)
- [https://github.com/day8/re-frame](https://github.com/day8/re-frame)
- [https://github.com/reagent-project/reagent](https://github.com/reagent-project/reagent)
- [https://github.com/flow-storm/flow-storm-debugger](https://github.com/flow-storm/flow-storm-debugger)

# Installation instructions

## Doom emacs
Go to `packages.el` and insert:

```
(package! clojure-tools :recipe
  (:host github :repo "Ralii/clojure-tools.el" :branch "master"))
```

# Functions

## Re-frame and reagent

### clojure-tools-force-render!
Instant refresh, faster than hot-reload. Needs `(setq render-function-ns "...")` to be specified and point to the render function of the application you want to fast refresh

### clojure-tools-eval-and-force-render!
Uses `clojure-tools-force-render!` but with defun-at-point as an argument. Good for example rendering a single component or trying it out with different props.
You can for example debug it like:

```
(def input-number 3)

(defn show-number [input-number]
  [:div number])
```

Then input-number is defined so you can point cursor to defn and render component with the `input-number = 3` value on the screen.

### clojure-tools-inspect-app-db
Uses cider inspector to view the global re-frame app-db.

### clojure-tools-subscribe-under-point
Show value of a subscription in cider inspector. Good for doing repl-driven ui development since you don't have to see views or browser to see values of subscriptions.
Put cursor on subscription name and it will show it's return value on cider inspector.

![subscribe-under-point](https://github.com/Ralii/clojure-tools.el/assets/7629039/9d0c1cbb-0152-4209-bbf7-ca87aa96f2dd)

## Snitch
Snitch is a great debugging library for Clojure/Clojurescript. It will inline-def bindings so you can use them in repl.

### clojure-tools-snitch-clj
Initialize snitch for Clojure. After running this snitch will be available on every ns.

### clojure-tools-snitch-cljs
Initialize snitch for Clojurescript. After running this snitch will be available on current ns. Difference with `clojure-tools-snitch-clj` is that you have run this on every `ns` you want
to use snitch and it will insert snitch manually on ns `require`.

![snitch](https://github.com/Ralii/clojure-tools.el/assets/7629039/e8d603b1-ef64-4c2f-9fb4-b2ff94e6bfb0)


### clojure-tools-cycle-defn*!

Will cycle `defn` and `defn*` to make it easier to toggle function to be used with snitch.

## Malli

### clojure-tools-malli-data->schema
Turn data into malli schema.

### clojure-tools-malli-schema->data
Turn malli-schema into data.

## Flowstorm
These need Flowstorm debugger to be installed

### clojure-tools-function-value
Shows previous function arguments and return value

![flowstormfun](https://github.com/Ralii/clojure-tools.el/assets/7629039/b30c8673-83a1-419f-b963-495fa77e3d79)


# Workflows
I will document some of the workflows I use around these tools in here with short videos or gifs.
