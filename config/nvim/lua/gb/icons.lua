local ok, web_devicons = pcall(require, "nvim-web-devicons")

if not ok then
    return
end

local colors = {
    bg = "#2e3440",
    fg = "#ECEFF4",
    red = "#bf616a",
    orange = "#d08770",
    yellow = "#ebcb8b",
    blue = "#5e81ac",
    green = "#a3be8c",
    cyan = "#88c0d0",
    magenta = "#b48ead",
    pink = "#FFA19F",
    grey1 = "#f8fafc",
    grey2 = "#f0f1f4",
    grey3 = "#eaecf0",
    grey4 = "#d9dce3",
    grey5 = "#c4c9d4",
    grey6 = "#b5bcc9",
    grey7 = "#929cb0",
    grey8 = "#8e99ae",
    grey9 = "#74819a",
    grey10 = "#616d85",
    grey11 = "#464f62",
    grey12 = "#3a4150",
    grey13 = "#333a47",
    grey14 = "#242932",
    grey15 = "#1e222a",
    grey16 = "#1c1f26",
    grey17 = "#0f1115",
    grey18 = "#0d0e11",
    grey19 = "#020203",
}

web_devicons.setup {
    override = {
        html = {
            icon = "",
            color = colors.orange,
            name = "html",
        },
        css = {
            icon = "",
            color = colors.blue,
            name = "css",
        },
        scss = {
            icon = "",
            color = colors.pink,
            name = "scss",
        },
        sass = {
            icon = "",
            color = colors.pink,
            name = "sass",
        },
        js = {
            icon = "",
            color = colors.yellow,
            name = "js",
        },
        ts = {
            icon = "ﯤ",
            color = colors.blue,
            name = "ts",
        },
        png = {
            icon = "",
            color = colors.magenta,
            name = "png",
        },
        jpg = {
            icon = "",
            color = colors.cyan,
            name = "jpg",
        },
        jpeg = {
            icon = "",
            color = colors.cyan,
            name = "jpeg",
        },
        mp3 = {
            icon = "",
            color = colors.green,
            name = "mp3",
        },
        mp4 = {
            icon = "",
            color = colors.green,
            name = "mp4",
        },
        out = {
            icon = "",
            color = colors.blue,
            name = "out",
        },
        rb = {
            icon = "",
            color = colors.red,
            name = "rb",
        },
        vue = {
            icon = "﵂",
            color = colors.green,
            name = "vue",
        },
        py = {
            icon = "",
            color = colors.orange,
            name = "py",
        },
        toml = {
            icon = "",
            color = colors.blue,
            name = "toml",
        },
        lock = {
            icon = "",
            color = colors.red,
            name = "lock",
        },
        zip = {
            icon = "",
            color = colors.cyan,
            name = "zip",
        },
        xz = {
            icon = "",
            color = colors.cyan,
            name = "xz",
        },
        deb = {
            icon = "",
            color = colors.red,
            name = "deb",
        },
        rpm = {
            icon = "",
            color = colors.red,
            name = "rpm",
        },
        lua = {
            icon = "",
            color = colors.blue,
            name = "lua",
        },
        txt = {
            icon = "",
            color = colors.blue,
            name = "txt",
        },
        md = {
            icon = "",
            color = colors.magenta,
            name = "markdown",
        },
        graphql = {
            icon = "",
            color = colors.pink,
            name = "graphql",
        },
        env = {
            icon = "",
            color = colors.yellow,
            name = "dotenvexample",
        },
        [".env.api.test"] = {
            icon = "",
            color = colors.yellow,
            name = "envapitest",
        },
        [".env.production"] = {
            icon = "",
            color = colors.yellow,
            name = "envprod",
        },
        [".env.development"] = {
            icon = "",
            color = colors.yellow,
            name = "envdev",
        },
        [".env.development.local"] = {
            icon = "",
            color = colors.yellow,
            name = "envlocal",
        },
        [".env.test"] = {
            icon = "",
            color = colors.yellow,
            name = "envtest",
        },
        [".env.example"] = {
            icon = "",
            color = colors.yellow,
            name = "dotenvexample",
        },
        [".env"] = {
            icon = "",
            color = colors.yellow,
            name = "dotenv",
        },
        ["docker-compose.yml"] = {
            icon = "",
            color = colors.cyan,
            name = "dockercompose",
        },
        [".dockerignore"] = {
            icon = "",
            color = colors.orange,
            name = "dockerignore",
        },
        [".prettierignore"] = {
            icon = "",
            color = colors.orange,
            name = "prettierignore",
        },
        [".prettierrc"] = {
            icon = "",
            color = colors.cyan,
            name = "prettier",
        },
        [".prettierrc.json"] = {
            icon = "",
            color = colors.cyan,
            name = "prettierjson",
        },
        [".prettierrc.js"] = {
            icon = "",
            color = colors.cyan,
            name = "prettierrcjs",
        },
        ["prettier.config.js"] = {
            icon = "",
            color = colors.cyan,
            name = "prettierjsconfig",
        },
        [".prettier.yaml"] = {
            icon = "",
            color = colors.cyan,
            name = "prettieryaml",
        },
        ["test.js"] = {
            icon = "",
            color = colors.yellow,
            name = "javascripttest",
        },
        ["test.jsx"] = {
            icon = "",
            color = colors.yellow,
            name = "reactrest",
        },
        ["test.ts"] = {
            icon = "",
            color = colors.blue,
            name = "typescripttest",
        },
        ["test.tsx"] = {
            icon = "",
            color = colors.blue,
            name = "reacttypescripttest",
        },
        ["spec.js"] = {
            icon = "",
            color = colors.yellow,
            name = "javascriptspectest",
        },
        ["spec.jsx"] = {
            icon = "",
            color = colors.yellow,
            name = "reactspectest",
        },
        ["spec.ts"] = {
            icon = "",
            color = colors.blue,
            name = "typescriptspectest",
        },
        ["spec.tsx"] = {
            icon = "",
            color = colors.blue,
            name = "reacttypescriptspectest",
        },
        ["yarn-error.log"] = {
            icon = "",
            color = colors.red,
            name = "yarnerrorlog",
        },
        ["yarn.lock"] = {
            icon = "",
            color = colors.blue,
            name = "yarnlock",
        },
        ["package.json"] = {
            icon = "",
            color = colors.red,
            name = "npm_packagejson",
        },
        ["package-lock.json"] = {
            icon = "",
            color = colors.red,
            name = "npm_packagelockjson",
        },
        [".npmrc"] = {
            icon = "",
            color = colors.red,
            name = "npmrc",
        },
        [".gitignore"] = {
            icon = "",
            color = colors.orange,
            name = "gitignore",
        },
        [".gitattributes"] = {
            icon = "",
            color = colors.orange,
            name = "gitattributes",
        },
        ["Dockerfile"] = {
            icon = "",
            color = colors.blue,
            name = "dockerfilex",
        },
        ["Dockerfile.concourse"] = {
            icon = "",
            color = colors.blue,
            name = "dockerconcourse",
        },
        ["Dockerfile.loadtest.concourse"] = {
            icon = "",
            color = colors.blue,
            name = "dockerloadconcourse",
        },
        [".nvmrc"] = {
            icon = "",
            color = colors.green,
            name = "nvmrc",
        },
        [".eslintignore"] = {
            icon = "ﯶ",
            color = colors.magenta,
            name = "eslintrcignore",
        },
        [".eslintrc.js"] = {
            icon = "ﯶ",
            color = colors.magenta,
            name = "eslintrcjs",
        },
        [".travis.yml"] = {
            icon = "",
            color = colors.red,
            name = "travis",
        },
        ["babel.config.js"] = {
            icon = "",
            color = colors.yellow,
            name = "babelconfig",
        },
        [".commitlintrc.json"] = {
            icon = "ﰚ",
            color = colors.green,
            name = "commitlinrcjson",
        },
    },
    default = true,
}
