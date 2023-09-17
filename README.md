# clojure-tools
Toolset for Clojure development

# Dependencies
- [https://github.com/clojure-emacs/cider](https://github.com/clojure-emacs/cider)
- [https://github.com/metosin/malli](https://github.com/metosin/malli)
- [https://github.com/AbhinavOmprakash/snitch](https://github.com/AbhinavOmprakash/snitch)
- [https://github.com/day8/re-frame](https://github.com/day8/re-frame)
- [https://github.com/reagent-project/reagent](https://github.com/reagent-project/reagent)

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

## Snitch
Snitch is a great debugging library for Clojure/Clojurescript. It will inline-def bindings so you can use them in repl.

### clojure-tools-snitch-clj
Initialize snitch for Clojure. After running this snitch will be available on every ns.

### clojure-tools-snitch-cljs
Initialize snitch for Clojurescript. After running this snitch will be available on current ns. Difference with `clojure-tools-snitch-clj` is that you have run this on every `ns` you want
to use snitch and it will insert snitch manually on ns `require`.

### clojure-tools-cycle-defn*
Will cycle `defn` and `defn*` to make it easier to toggle function to be used with snitch.

## Malli

### clojure-tools-malli-data->schema

### clojure-tools-malli-schema->data

