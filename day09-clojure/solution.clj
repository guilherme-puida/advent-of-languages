(ns solution
  (:require [clojure.string :as str]
            [clojure.java.io :as io]))

(def directions
  {"U" [0 -1] "D" [0 1] "L" [-1 0] "R" [1 0]})

(defn parse-move [move]
  (let [[dir amount] (str/split move #" ")]
    (repeat (Integer/parseInt amount) dir)))

(def moves
  (->> (line-seq (io/reader *in*))
       (mapcat parse-move)))

(defn vec-add [[u1 u2] [v1 v2]]
  [(+ u1 v1) (+ u2 v2)])

(defn vec-sub [[u1 u2] [v1 v2]]
  [(- u1 v1) (- u2 v2)])

(defn vec-abs [v]
  (vec (map abs v)))

(defn dist [a b]
  (reduce max (vec-abs (vec-sub a b))))

(defn clamp [n min max]
  (if (< n min) min (if (> n max) max n)))>

(defn normalize [v]
  (vec (map #(clamp % -1 1) v)))

(defn move-tail [head tail]
  (if (> (dist head tail) 1)
    (vec-add tail (normalize (vec-sub head tail)))
    tail))

(defn move-knot [rope knot]
  (conj rope (move-tail (last rope) knot)))

(defn move [history dir]
  (let [[head & rest] (first history)
        next-head (vec-add head (directions dir))
        rope (seq (reduce move-knot [next-head] rest))]
    (conj history rope)))

(defn solve [length]
  (->> (reduce move (seq [(repeat length [0 0])]) moves)
       (map last)
       (set)
       (count)))

(println "Part 1:" (solve 2))
(println "Part 2:" (solve 10))