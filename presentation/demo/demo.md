# Demo

## Introducción, UI inicial, edición de código, errores, kernel

```
local 2 in
  X = Y
end
```
## Sintáxis básica, inline expressions, ejecucion

```
local R X in
  X = 2 + 3

  if X > 5 then
    case person(age:11*3)
    of person(age:A) then
      R = A / 11
    end
  else
    R = local F in
      F = 0.4 + 3 / 5
      F * F
    end
  end
end

```

## Literals and values

Notas: Como se muestran en el store lo mas recientemente tocado arriba

```
local N R1 R2 P F in
  N = 10
  R1 = person(age:33)
  P = proc {$ A B C}
    C = A + B
  end
  fun {F A B} A + B end


  R2 = person(age:{F 30 3})
end
```

## Exceptions y global exceptions

```
try
  raise myFailure(code:10) end
  skip
catch Error then
  raise uncaughtException(field1:500) end
end
```

## Threads

```
local X R Y in
  
  thread
    X = 5
  end
  
  Y = thread
    {fun {$} 10 end}
  end
  
  R = if X * Y > 40 then
    bigNumber(X*Y)
  else
    smallNumber(X*Y)
  end
end
```

## Lazy
```
local R F X in
  fun lazy {F A} A|{F A} end
  
  X = {F 10}
  
  R = X.2.1
end
```

## Cells

```
local R C in
  C = {NewCell 10}

  C := 20

  R = @C
end
```

## Ports

```
local R P S in

  P = thread
    {NewPort S}
  end

  thread
    {Send P 10}
  end

  thread
    R = case S
    of H|T then H
    end
  end
end
```
