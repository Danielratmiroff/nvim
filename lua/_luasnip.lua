local ls = require("luasnip")

local fmt = require("luasnip.extras.fmt").fmt

local snip = ls.snippet
local n = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local rep = require("luasnip.extras").rep -- Repeat a value
local same = require("luasnip.extras").rep -- Repeat a function

-- Snippet format:
-- snip({ trigger, name, description }, { ...nodes })

ls.add_snippets(nil, {
  --
  -- GO Snippets
  --
  go = {
    -- fmt.Println
    snip({
      trig = "prl",
      namr = "(GO) Println",
    },
      fmt('fmt.Println("{}")', { i(0) })),

    --  fmt.Printf
    snip({
      trig = "prf",
      namr = "(GO) Printf",
      dscr = "Print with formatters",
    },
      fmt('fmt.Printf("{}", {}")', { i(1), i(0, "varName") })),

    -- func
    snip({
      trig = "func",
      namr = "(GO) func snippet",
      dscr = "func myFunc (aParam) returnType { ... }",
    },
      fmt([[func {} ({}) {} {{
  {}
}}]]   , { i(1, "myFunc"), i(2, "aParam"), i(3, "returnType"), i(0) })),

    -- Struct
    snip({
      trig = "stu",
      namr = "(GO) struct snippet",
      dscr = "type myStruct struct { ... }",
    },
      fmt([[type {} struct {{ 
  {}
}}]]   , { i(1, "myStruct"), i(0, "value") })),

    -- Interface
    snip({
      trig = "itf",
      namr = "(GO) interface snippet",
      dscr = "type myInterface interface { ... }",
    },
      fmt([[type {} interface {{ 
  {}() {}
}}]]   , { i(1, "myInterface"), i(2), i(0) })),

    -- If error
    snip({
      trig = "iferr",
      namr = "(GO) if error snippet",
      dscr = "if err != nil { ... }",
    },

      fmt([[if {} != nil {{ 
  log.Fatalf("{} :%v", {}) 
}}]]   , { i(1, "errVar"), i(0), rep(1) })),
  },
  --
  -- Javascript Snippets
  --
  all = {
    -- Console.log
    snip({
      trig = "cl",
      namr = "(JS) Console log",
    },
      fmt('console.log({})', { i(0) })),

    -- useEffect
    snip({
      trig = "uef",
      namr = "(JS) useEffect",
    },
      fmt([=[
useEffect(() => {{
  {}
}}, [{}]
]=]    , { i(0), i(1, "dependency") })),

    -- useState
    snip({
      trig = "ust",
      namr = "(JS) useState",
    },
      fmt([[const [{},set{}] = useState({})]], { i(1, "varName"), rep(1), i(0, "value") }))

  }
})
