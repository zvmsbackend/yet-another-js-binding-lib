open System.IO

let generateUnion (writer: TextWriter) num =
    writer.WriteLine("///|")
    seq {1..num}
    |> Seq.map (sprintf "T%d")
    |> String.concat " | "
    |> sprintf "/// Represents TypeScript union `%s`."
    |> writer.WriteLine
    writer.WriteLine("#external")
    let typeVars =
        seq {1..num}
        |> Seq.map (sprintf "T%d")
        |> String.concat ", "
        |> sprintf "[%s]"
    writer.WriteLine($"type U{num}{typeVars}")
    writer.WriteLine()
    seq {1..num}
    |> Seq.iter (fun i ->
        writer.WriteLine("///|")
        writer.WriteLine($"/// Creates a `U{num}` from `T{i}`.")
        writer.WriteLine($"pub fn{typeVars} U{num}::from_t{i}(obj : T{i}) -> U{num}{typeVars} = \"%%identity\"")
        writer.WriteLine()
        writer.WriteLine("///|")
        writer.WriteLine($"/// Casts a `U{num}` to `T{i}` without runtime check.")
        writer.WriteLine($"pub fn{typeVars} U{num}::unsafe_as_t{i}(self : U{num}{typeVars}) -> T{i} = \"%%identity\"")
        writer.WriteLine())

do
    use writer = new StreamWriter("unions.mbt")
    seq {2..9} |> Seq.iter (generateUnion writer)
