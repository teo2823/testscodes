// pony -b teo
actor Main
  new create(env: Env) =>
    env.input(
      object iso is InputNotify
        fun iterator(data: Array[String]): Array[String] =>
          data.slice(1, data.size())

        fun calculate_prof(n: I32, m: I32, x: I32, floor: I32): I32 =>
          if floor > n then
            return 0
          end
          let calc_floor = ((floor - 1) / m) * 1000
          let current_p = x + calc_floor 
          let profit_for = current_p
          profit_for + calculate_prof(n, m, x, floor + 1)


        fun process_data(data: Array[String])? =>
          if data.size() > 0 then
            var line: Array[String] = data(0)?.split_by(" ")
            let n: I32 = line(0)?.i32()?
            let m: I32 = line(1)?.i32()?
            let x: I32 = line(2)?.i32()?
            let result = calculate_prof(n, m, x, 1)
            env.out.print(result.string() + " ")
            process_data(data.slice(1, data.size()))?
          end

        fun ref apply(data: Array[U8] iso) =>
          var input_data: String = String.from_iso_array(consume data)
          var lines: Array[String] = input_data.split_by("\n")
          var real_data: Array[String] = lines.slice(1, lines.size() - 1)
          
          try
            process_data(real_data)?
          end

        fun ref dispose() =>
          None
      end,
      512)

// cat DATA.lst | ./teo2823
//4500 
//269000 
//12500 
//0 
//93000 
//19500 
//286000 
//14000 
//40000 
//132000 
//102500 
//26000 
//35000 
//0 