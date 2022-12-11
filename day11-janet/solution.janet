# Hand parsed :^)
(defn get-monkeys 
  []
  @[{:items @[77 69 76 77 50 58]
     :op |(* $ 11)
     :test 5 :true 1 :false 5}

    {:items @[75 70 82 83 96 64 62]
     :op |(+ $ 8)
     :test 17 :true 5 :false 6}

    {:items @[53]
     :op |(* $ 3)
     :test 2 :true 0 :false 7}

    {:items @[85 64 93 64 99]
     :op |(+ $ 4)
     :test 7 :true 7 :false 2}

    {:items @[61 92 71]
     :op |(* $ $)
     :test 3 :true 2 :false 3}

    {:items @[79 73 50 90]
     :op |(+ $ 2)
     :test 11 :true 4 :false 6}

    {:items @[50 89]
     :op |(+ $ 3)
     :test 13 :true 4 :false 3}

    {:items @[83 56 64 58 93 91 56 65]
     :op |(+ $ 5)
     :test 19 :true 1 :false 0}])

(defn dividers-lcm
  [monkeys]
  (let [dividers (map |($ :test) monkeys)]
    (reduce math/lcm 1 dividers)))

(defn execute-round
  [monkeys post inspected items]
  (loop [[monkey-index monkey] :pairs monkeys]
    (+= (inspected monkey-index) (length (monkey-index items)))
    (each item (monkey-index items)
      (let [u (post ((monkey :op) item))
            dst (if (= 0 (% u (monkey :test))) :true :false)]
              (array/push ((monkey dst) items) u)))
    (set (items monkey-index) @[])))

(defn solve
  [monkeys rounds post]
  (let [inspected (array/new-filled (length monkeys) 0)
        items (map |($ :items) monkeys)]
          (loop [i :range [0 rounds]] (execute-round monkeys post inspected items))
          (sort inspected >)
          (* (0 inspected) (1 inspected))))


(print "Part 1: " (solve (get-monkeys) 20 |(math/floor (/ $ 3))))

(def lcm (dividers-lcm (get-monkeys)))
(print "Part 2: " (solve (get-monkeys) 10000 |(% $ lcm)))


