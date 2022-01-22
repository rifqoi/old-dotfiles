/* See LICENSE file f{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },or copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const int startwithgaps[]    = { 1 };	/* 1 means gaps are used by default, this can be customized for each tag */
static const unsigned int gappx[]   = { 10 };   /* default gap between windows in pixels, this can be customized for each tag */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int vertpad            = 0;       /* vertical padding of bar */
static const int sidepad            = 0;       /* horizontal padding of bar */
static const int focusonwheel       = 0;
static const char *fonts[]          = {	"DroidSansMono Nerd Font:size=15",
					"Material Design Icons-Regular:size=19",
				      };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
//static const char *colors[][3]      = {
//	/*               fg         bg         border   */
//	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
//	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
//};
//#include "/home/thousandv/templates/dwm/colors-fix.h"
//#include "/home/thousandv/.cache/dwm-colors/dwm-miyamotomusashi.h"
#include "/home/thousandv/templates/dwm/dwm-miyamotomusashi.h"
typedef struct {
	const char *name;
	const void *cmd;
} Sp;
//const char *spcmd1[] = {"Alacritty", "-n", "spterm", "-g", "120x34", NULL };
const char *spcmd1[] = {"alacritty", "--class", "spterm", "-o", "window.dimensions.columns=120", "-o", "window.dimensions.lines=34" , NULL };
const char *spcmd2[] = {"alacritty", "--class", "spranger", "-o", "window.dimensions.columns=120", "-o", "window.dimensions.lines=34" ,"-e", "ranger", NULL };
const char *spcmd3[] = {"nautilus", NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"spranger",    spcmd2},
	{"keepassxc",   spcmd3},
};

/* tagging */
static const char *tags[] = { "󰫣", "󰫣", "󰫣", "󰫣", "󰫣", "󰫣", "󰫣", "󰫣", "󰫣" };
static const char *tagsalt[] = { "󰫢", "󰫢", "󰫢", "󰫢", "󰫢", "󰫢", "󰫢", "󰫢", "󰫢" }; 
static const char *togglealttags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };   //toggle tags to num


static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     iscentered   isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            0,           1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           0,           -1 },
	{ "flameshot",NULL,       NULL,       0,            0,           1,           -1 },
	{ "Spotify",  NULL,       NULL,       1 << 3,       0,           0,           -1 },
	{ "discord",  NULL,       NULL,       1 << 1,       0,           0,           -1 },
	{ "Steam",    NULL,       NULL,       1 << 3,       0,           1,           -1 },
	{ "Lutris",    NULL,       NULL,       1 << 3,      1,           1,           -1 },
	{ "explorer.exe",    NULL,       NULL,      0,      1,           1,           -1 },
	{ "Nautilus", NULL,       NULL,       0,            1,           -1,          -1 },
	{ "sun-awt-X11-XFramePeer", NULL,       NULL,       0,            -1,           -1,          -1 },
	{ "zoom", NULL,       NULL,       1 << 3,            1,           -1,          -1 },
        { "Sxiv",     NULL,       NULL,       0,            1,           1,          -1 },
	{ NULL,    "spterm",      NULL,       SPTAG(0),      1,          1,           -1 },
	{ NULL,    "spranger",      NULL,       SPTAG(0),      1,          1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "󰙀",      tile },    /* first entry is default */
	{ "󰹙",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "󰽙",      bstack },
	{ "󰜩",      bstackhoriz },
};

/* key definitions */
#define MODKEY Mod4Mask
#define AltKey Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },
#define STACKKEYS(MOD,ACTION) \
	{ MOD, XK_j,     ACTION##stack, {.i = INC(+1) } }, \
	{ MOD, XK_k,     ACTION##stack, {.i = INC(-1) } }, \
	{ MOD, XK_grave, ACTION##stack, {.i = PREVSEL } }, \
/*	{ MOD, XK_q,     ACTION##stack, {.i = 0 } }, \ 
	{ MOD, XK_a,     ACTION##stack, {.i = 1 } }, \
	{ MOD, XK_z,     ACTION##stack, {.i = 2 } }, \ 
	{ MOD, XK_x,     ACTION##stack, {.i = -1 } }, */
/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "alacritty", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,	                XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	STACKKEYS(MODKEY,                          focus)
	STACKKEYS(MODKEY|ShiftMask,                push)
	{ MODKEY, 			XK_Tab,    focusstack,   {.i = INC(+1) } },
	{ MODKEY|ShiftMask,		XK_Tab,    focusstack,   {.i = INC(-1) } },
//	{ MODKEY,	                XK_Tab,    focusstack,     {.i = +1 } },
//	{ MODKEY|ShiftMask,             XK_Tab,    focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_i,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,                      XK_l,      setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,                      XK_o,      setcfact,       {.f =  0.00} },

	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
//	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_n,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_o,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefakefullscreen, {0} },
	{ MODKEY,                       XK_f,      togglefullscr, {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ AltKey,                       XK_n,      togglealttag,   {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,            			XK_y,  	   togglescratch,  {.ui = 0 } },
	{ MODKEY|ShiftMask,            			XK_e,	   togglescratch,  {.ui = 1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -5 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +5 } },
	{ MODKEY|ShiftMask,             XK_minus,  setgaps,        {.i = GAP_RESET } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = GAP_TOGGLE} },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_r,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

