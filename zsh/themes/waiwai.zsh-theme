# ╭── 𖹭 NAMESPACE 𖹭 ───────────────────────────────────────────────────────────────────────────────
# │
# ✦ ─ Color & formatting ──────────────────────────────────────────────────────────────────────────

RED="%{$fg[red]%}"
GREEN="%{$fg[green]%}"
BLUE="%{$fg[blue]%}"
CYAN="%{$fg[cyan]%}"
WHITE="%{$fg[white]%}"
GRAY="%F{8}"

ITALIC="%{\e[3m%}"
RESET_I="%{\e[0m%}"
RESET_C="%{$reset_color%}"

# ✮ SET ⋆ YOUR ⋆ BIRTHDAY ⋆ HERE ✮
# ⋆ Use mmdd format:              │
# ⋆ January 27 → 127              │
# ⋆ March 5 → 305                 │
# ⋆ etc.                          │
typeset -i BIRTHDAY=1012 # <-─────╯

typeset -i CURRENT_YEAR=$(date +%Y)
typeset -i CURRENT_DATE=10#$(date +%m%d)

# ✦ ─ Local variables ─────────────────────────────────────────────────────────────────────────────

local user_name="%(!.${RED}.${CYAN})%n"
local host_name="%(!.${RED}.${CYAN})%m"
local user_prompt

if (( CURRENT_DATE == BIRTHDAY )); then
  user_prompt="%Bજ⁀➴˚｡✧${CYAN}happy b${WHITE}★${CYAN}day ${user_name}!${RESET_C}%B✧ ༘⭒｡˚%b"
else
  user_prompt="%B${user_name}${WHITE}‧${host_name}${RESET_C}"
fi

local current_dir="%B${BLUE}%~${RESET_C}"
local return_code="%B%(?..${RED}%? ❰${RESET_C})"

local vcs_prompt='$(git_prompt_info)'

local emoji='%B%(?.%{$(get_emoji)%}  .${FAIL})%b'

# ╭── 𖹭 EMOJI 𖹭 ───────────────────────────────────────────────────────────────────────────────────
# │
# ✦ ─ Emoji sets ──────────────────────────────────────────────────────────────────────────────────

EMOJI_DEFAULT=(🦴 🐱 🦄 🐁 🐛 🤍 🐍 🐢 🐚 🌴 🌹 🍸 🪿 🍓 🍞 🍌 🍆 🧁 🫪 ☠️ 🖖 🧠 🥾 💰 📌 🛸
🫦 👠 🧚‍♀️ 🐑 👑 💸 🧃 ✨ 🎱 🎲 🚬 🗿 👽 🩼 💭 🦭 🥡 🧋 🪵 🍔 🪄 🎯 ⚾ 📦 👛 👒 ☕️ 🎸 🔮 💎 💾 )
EMOJI_CATS=(🐱 😺 😸 😹 😻 😼 😽 🙀 😿 😾 🧶 )
EMOJI_QUEER=(❤️ 🩷 🧡 💛 💚 🩵 💙 💜 🏳️‍🌈 )
EMOJI_CAKE=(🎂 )
EMOJI_XMAS=(🎄 🎅 🎇 🎉 🍾 🎁 🦌 ☃️ 🛷 🥂 ❄️ 🧣 🍪 ⛸️ 🎀 )
EMOJI_CHEESE=(🧀 )
EMOJI_EDUCATION=(🎓 📖 📚 )
EMOJI_AUSTRALIA=(🦘 🇦🇺 🐨 🐊 🕷️ 🍺 🏄 🪃 🌊 )
EMOJI_CANDLE=(🕯️ )
EMOJI_UMBRELLA=(☂️ 🌂 )
EMOJI_RADIO=(📻 🎙️ 🎧 )
EMOJI_LOVE=(💘 💞 💕 💝 💖 💌 )
EMOJI_CHINESE_NY=(🐲 🧧 🥮 🐉 🍊 🥠 🪭 🎆 🫖 🏮 )
EMOJI_TOOTH=(🦷 )
EMOJI_FEMALE=(♀️ )
EMOJI_MARIO=(🏰 👸🏼 🍄 🐢 ☁️ 👲🏻 )
EMOJI_ST_PATRICK=(🍻 ☘️ 💚 🍀 🪉 🇮🇪 )
EMOJI_SAKURA=(🌸 )
EMOJI_NOWRUZ=(🌷 🌱 🪻 ☀️ 🕌 🍏 🐫 )
EMOJI_WAFFLE=(🧇 )
EMOJI_ZERO_WASTE=(♻️ )
EMOJI_TRANS=(🩵 🩷 🤍 🩷 🩵 🏳️‍⚧️ )
EMOJI_AUTISM=(♾️ 🧩 🌈 )
EMOJI_ACE=(🖤 🩶 🤍 💜 🍰 )
EMOJI_SONGKRAN=(🐘 🔫 🏵️ 🧡 🛵 💦 )
EMOJI_EARTH=(🌍 🌎 🌏 )
EMOJI_PENGUIN=(🐧 )
EMOJI_EASTER=(🥚 🪺 ⛪ 🩷 🐝 🐇 🎗️ 🐣 🍫 🥕 🌼 🔔 🧺 )
EMOJI_PRETZEL=(🥨 )
EMOJI_JAZZ=(🎷 🪊 🎹 🥁 🎼 )
EMOJI_SPACE=(🚀 🪐 🛸 🌜 🛰️ 📡 💫 🔭 ☄️ )
EMOJI_MEXICO=(🌮 🇲🇽 💃 🥑 🪇 🌵 🌶️ 🪅 )
EMOJI_VICTORY=(🎖️ 🪖 ✌️ )
EMOJI_FOOTBALL=(⚽ )
EMOJI_POTATO=(🥔 🍠 🍟 )
EMOJI_DONUT=(🍩 )
EMOJI_ITALY=(🍕 🍝 🇮🇹 🏛️ 🤌 )
EMOJI_CANADA=(🍁 🦫 🥞 🇨🇦 🏒 🥌 )
EMOJI_USA=(🗽 🌭 🇺🇸 🎺 🍔 🥜 🦅 📜 🏈 )
EMOJI_FRANCE=(🥖 🇫🇷 ⚜️ 📽️ 🥐 🏰 🎈 )
EMOJI_WATERMELON=(🍉 )
EMOJI_LABOR=(🦺 ⛑️ 💼 ⛏️ ⚒️ 🛠️ 🔧 🧰 🔬 )
EMOJI_PIEROGI=(🥟 )
EMOJI_POST=(✉️ 📯 📮 🏣 📫 📪 📬 📭 📨 )
EMOJI_UN=(🇺🇳 )
EMOJI_HALLOWEEN=(🎃 👻 🍬 🕸️ 🦇 💀 🍷 ⚰️ 🕷️ 🪦 🧟 )
EMOJI_JAPAN=(🎎 🎐 🍙 🍡 🍣 🍶 🍥 🗼 🍢 💮 🍘 🥢 🍤 🍵 🎏 👘 ⛩️ )
EMOJI_TOILET=(🚽 🧻 💩 )
EMOJI_THANKSGIVING=(🦃 🌰 🍗 🌽 🕯️ 🍄‍🟫 🙏 🍂 🥧 )
EMOJI_MONKEY=(🐵 🙈 🙉 🙊 )
EMOJI_BASKETBALL=(🏀 )
EMOJI_DUDE=(🐸 )
FAIL="💥"
PI="π"

# ✦ ─ Holiday checks ──────────────────────────────────────────────────────────────────────────────

function is_pi_time() {
  local time=$(date +%l%M)

  (( time == 314 ))
}

function is_your_birthday() {
  (( CURRENT_DATE == BIRTHDAY ))
}

function is_xmas_season() {
  # Dec 23 → 12.23
  # Jan 7  → 1.07
  (( CURRENT_DATE >= 1223 || CURRENT_DATE <= 107 ))
}

function is_nothing_day() {
  # Jan 16 → 1.16
  (( CURRENT_DATE == 116 ))
}

function is_cheese_day() {
  # Jan 20 → 1.20
  # Jun 04 → 6.04
  (( CURRENT_DATE == 120 || CURRENT_DATE == 604 ))
}

function is_education_day() {
  # Jan 24 → 1.24
  (( CURRENT_DATE == 124 ))
}

function is_australia_day() {
  # Jan 26 → 1.26
  (( CURRENT_DATE == 126 ))
}

function is_holocaust_remembrance_day() {
  # Jan 27 → 1.27
  (( CURRENT_DATE == 127 ))
}

function is_umbrella_day() {
  # Feb 10 → 2.10
  (( CURRENT_DATE == 210 ))
}

function is_radio_day() {
  # Feb 13 → 2.13
  (( CURRENT_DATE == 213 ))
}

function is_valentine_day() {
  # Feb 14 → 2.14
  (( CURRENT_DATE == 214 ))
}

function is_cat_day() {
  # Aug 8 → 8.08 (International)
  # Oct 29 → 10.29 (US)
  # Feb 22 → 2.22 (Japan)
  # Mar 01 → 3.01 (Russia)
  local -a cat_days=(222 301 808 1029)

  (( ${cat_days[(Ie)$CURRENT_DATE]} ))
}

function is_chinese_new_year() {
  local eve
  local end

  case $CURRENT_YEAR in
    2026)
      # Feb 17 → 2.17
      eve=217
      # Mar 3 → 3.03
      end=303
      # etc.
      ;;
    2027)
      eve=206
      end=220
      ;;
    2028)
      eve=126
      end=209
      ;;
    *)
      return 1
      ;;
  esac

  (( CURRENT_DATE >= eve && CURRENT_DATE <= end ))
}

function is_dentist_day() {
  # Mar 6 → 3.06
  (( CURRENT_DATE == 306 ))
}

function is_women_day() {
  # Mar 8 → 3.08
  (( CURRENT_DATE == 308 ))
}

function is_mario_day() {
  # Mar 10 → 3.10
  (( CURRENT_DATE == 310 ))
}

function is_pi_day() {
  # Mar 14 → 3.14
  (( CURRENT_DATE == 314 ))
}

function is_saint_patrick_day() {
  # Mar 17 → 3.17
  (( CURRENT_DATE == 317 ))
}

function is_vernal_equinox() {
  # Mar 20 → 3.20
  (( CURRENT_DATE == 320 ))
}

function is_nowruz() {
  # Mar 21 → 3.21
  # Mar 23 → 3.23
  (( CURRENT_DATE >= 321 && CURRENT_DATE <= 323 ))
}

function is_waffle_day() {
  # Mar 25 → 3.25 (Sweden)
  # Aug 24 → 8.24 (US)

  (( CURRENT_DATE == 325 || CURRENT_DATE == 824 ))
}

function is_zero_waste_day() {
  # Mar 30 → 3.30
  (( CURRENT_DATE == 330 ))
}

function is_trans_visibility_day() {
  # Mar 31 → 3.31
  (( CURRENT_DATE == 331 ))
}

function is_autism_awareness_day() {
  # Apr 2 → 4.02
  (( CURRENT_DATE == 402 ))
}

function is_asexuality_day() {
  # Apr 6 → 4.06
  (( CURRENT_DATE == 406 ))
}

function is_yuris_night() {
  # Apr 12 → 4.12
  (( CURRENT_DATE == 412 ))
}

function is_songkran() {
  # Apr 13 → 4.13
  # Apr 15 → 4.15
  (( CURRENT_DATE >= 413 && CURRENT_DATE <= 415 ))
}

function is_earth_day() {
  # Apr 22 → 4.22
  (( CURRENT_DATE == 422 ))
}

function is_penguin_day() {
  # Apr 25 → 4.25
  (( CURRENT_DATE == 425 ))
}

function is_easter() {
  local eve
  local end

  case $CURRENT_YEAR in
    2026)
      # Mar 29 → 3.29
      eve=329
      # Apr 5 → 4.05
      end=405
      # etc.
      ;;
    2027)
      eve=321
      end=328
      ;;
    2028)
      eve=409
      end=416
      ;;
    *)
      return 1
      ;;
  esac

  (( CURRENT_DATE >= eve && CURRENT_DATE <= end ))
}


function is_pretzel_day() {
  # Apr 26 → 4.26
  (( CURRENT_DATE == 426 ))
}

function is_jazz_day() {
  # Apr 30 → 4.30
  (( CURRENT_DATE == 430 ))
}

function is_space_day() {
  local day month weekday

  day=10#$(date +%d)
  month=10#$(date +%m)
  weekday=$(date +%u) # Monday → 1 <...> Sunday → 7

  (( weekday == 5 && month == 5 && day <= 7 ))
}

function is_cinco_de_mayo() {
  # May 5 → 5.05
  (( CURRENT_DATE == 505 ))
}

function is_victory_day() {
  # May 8 → 5.08
  # May 9 → 5.09
  (( CURRENT_DATE >= 508 && CURRENT_DATE <= 509 ))
}

function is_football_day() {
  # May 25 → 5.25
  (( CURRENT_DATE == 525 ))
}

function is_potato_day() {
  # May 30 → 5.30
  (( CURRENT_DATE == 530 ))
}

function is_donut_day() {
  local day month weekday

  day=10#$(date +%d)
  month=10#$(date +%m)
  weekday=$(date +%u) # Monday → 1 <...> Sunday → 7

  (( weekday == 5 && month == 6 && day <= 7 ))
}

function is_italian_national_day() {
  # Jun 2 → 6.02
  (( CURRENT_DATE == 602 ))
}

function is_pride_month() {
  month=10#$(date +%m)

  (( month == 6 ))
}

function is_canada_day() {
  # Jul 1 → 7.01
  (( CURRENT_DATE == 701 ))
}

function is_july_4th() {
  # Jul 4 → 7.04
  (( CURRENT_DATE == 704 ))
}

function is_bastille_day() {
  # Jul 14 → 7.14
  (( CURRENT_DATE == 714 ))
}

function is_watermelon_day() {
  # Aug 3 → 8.03
  (( CURRENT_DATE == 803 ))
}

function is_labor_day() {
  local day month weekday

  day=10#$(date +%d)
  month=10#$(date +%m)
  weekday=$(date +%u) # Monday → 1 <...> Sunday → 7

  (( weekday == 1 && month == 9 && day <= 7 ))
}

function is_pierogi_day() {
  # Oct 8 → 10.08
  (( CURRENT_DATE == 1008 ))
}

function is_world_post_day() {
  # Oct 9 → 10.09
  (( CURRENT_DATE == 1009 ))
}

function is_united_nations_day() {
  # Oct 24 → 10.24
  (( CURRENT_DATE == 1024 ))
}

function is_halloween() {
  # Oct 25 → 10.25
  # Oct 31 → 10.31
  (( CURRENT_DATE >= 1025 && CURRENT_DATE <= 1031 ))
}

function is_japanese_culture_day() {
  # Nov 3 → 11.03
  (( CURRENT_DATE == 1103 ))
}

function is_toilet_day() {
  # Nov 19 → 11.19
  (( CURRENT_DATE == 1119 ))
}

function is_thanksgiving_season() {
  local nov_1st_weekday days_to_first_thursday days_to_thanksgiving
  local thanksgiving today diff

  # Find Thanksgiving:

  # 1) Get the ISO weekday number of Nov 1
  nov_1st_weekday=$(date -d "$CURRENT_YEAR-11-01" +%u)

  # 2) Calculate the number of days to the first Thursday
  days_to_first_thursday=$(( (4 - $nov_1st_weekday + 7) % 7 ))

  # 3) Add 3 weeks (21 days) to first Thursday
  days_to_thanksgiving=$(( $days_to_first_thursday + 21 ))

  # 4) Get Thanksgiving & current timestamps
  thanksgiving=$(date -d "$CURRENT_YEAR-11-01 +$days_to_thanksgiving days" +%s)  
  today=$(date +%s)

  # Difference from today to Thanksgiving (in days)
  # 86400 → seconds in a day
  diff=$(( (thanksgiving - today) / 86400 ))

  (( diff >= 0 && diff <= 7 ))
}

function is_monkey_day() {
  # Dec 14 → 12.14
  (( CURRENT_DATE == 1214 ))
}

function is_basketball_day() {
  # Dec 21 → 12.21
  (( CURRENT_DATE == 1221 ))
}

function is_wednesday() {
  local weekday=$(date +%u) # Monday → 1 <...> Sunday → 7

  (( weekday == 3 ))
}

# ✦ ─ Randomizer ──────────────────────────────────────────────────────────────────────────────────

random_from_array() {
  local name=$1
  local -a arr
  arr=( "${(@P)name}" )
  echo -n "${arr[RANDOM % ${#arr[@]} + 1]}"
}

# ✦ ─ Pick the right set ──────────────────────────────────────────────────────────────────────────

function get_emoji() {
  if is_pi_time || is_pi_day; then
    echo -n "$PI"
  elif is_your_birthday; then
    random_from_array EMOJI_CAKE
  elif is_xmas_season; then
    random_from_array EMOJI_XMAS
  elif is_nothing_day; then
    echo -n "⁤"
  elif is_cheese_day; then
    random_from_array EMOJI_CHEESE
  elif is_education_day; then
    random_from_array EMOJI_EDUCATION
  elif is_australia_day; then
    random_from_array EMOJI_AUSTRALIA
  elif is_holocaust_remembrance_day; then
    random_from_array EMOJI_CANDLE
  elif is_umbrella_day; then
    random_from_array EMOJI_UMBRELLA
  elif is_radio_day; then
    random_from_array EMOJI_RADIO
  elif is_valentine_day; then
    random_from_array EMOJI_LOVE
  elif is_cat_day; then
    random_from_array EMOJI_CATS
  elif is_chinese_new_year; then
    random_from_array EMOJI_CHINESE_NY
  elif is_dentist_day; then
    random_from_array EMOJI_TOOTH
  elif is_women_day; then
    random_from_array EMOJI_FEMALE
  elif is_mario_day; then
    random_from_array EMOJI_MARIO
  elif is_saint_patrick_day; then
    random_from_array EMOJI_ST_PATRICK
  elif is_vernal_equinox; then
    random_from_array EMOJI_SAKURA
  elif is_nowruz; then
    random_from_array EMOJI_NOWRUZ
  elif is_waffle_day; then
    random_from_array EMOJI_WAFFLE
  elif is_zero_waste_day; then
    random_from_array EMOJI_ZERO_WASTE
  elif is_trans_visibility_day; then
    random_from_array EMOJI_TRANS
  elif is_autism_awareness_day; then
    random_from_array EMOJI_AUTISM
  elif is_asexuality_day; then
    random_from_array EMOJI_ACE
  elif is_yuris_night; then
    random_from_array EMOJI_SPACE
  elif is_songkran; then
    random_from_array EMOJI_SONGKRAN
  elif is_earth_day; then
    random_from_array EMOJI_EARTH
  elif is_penguin_day; then
    random_from_array EMOJI_PENGUIN
  elif is_easter; then
    random_from_array EMOJI_EASTER
  elif is_pretzel_day; then
    random_from_array EMOJI_PRETZEL
  elif is_jazz_day; then
    random_from_array EMOJI_JAZZ
  elif is_space_day; then
    random_from_array EMOJI_SPACE
  elif is_cinco_de_mayo; then
    random_from_array EMOJI_MEXICO
  elif is_victory_day; then
    random_from_array EMOJI_VICTORY
  elif is_football_day; then
    random_from_array EMOJI_FOOTBALL
  elif is_potato_day; then
    random_from_array EMOJI_POTATO
  elif is_donut_day; then
    random_from_array EMOJI_DONUT
  elif is_italian_national_day; then
    random_from_array EMOJI_ITALY
  elif is_pride_month; then
    random_from_array EMOJI_QUEER
  elif is_canada_day; then
    random_from_array EMOJI_CANADA
  elif is_july_4th; then
    random_from_array EMOJI_USA
  elif is_bastille_day; then
    random_from_array EMOJI_FRANCE
  elif is_watermelon_day; then
    random_from_array EMOJI_WATERMELON
  elif is_labor_day; then
   random_from_array EMOJI_LABOR
  elif is_pierogi_day; then
    random_from_array EMOJI_PIEROGI
  elif is_world_post_day; then
    random_from_array EMOJI_POST
  elif is_united_nations_day; then
    random_from_array EMOJI_UN
  elif is_halloween; then
    random_from_array EMOJI_HALLOWEEN
  elif is_japanese_culture_day; then
    random_from_array EMOJI_JAPAN
  elif is_toilet_day; then
    random_from_array EMOJI_TOILET
  elif is_thanksgiving_season; then
    random_from_array EMOJI_THANKSGIVING
  elif is_monkey_day; then
    random_from_array EMOJI_MONKEY
  elif is_basketball_day; then
    random_from_array EMOJI_BASKETBALL
  elif is_wednesday; then
    random_from_array EMOJI_DUDE
  else
    random_from_array EMOJI_DEFAULT
  fi
}

# ╭── 𖹭 EXTRA 𖹭 ───────────────────────────────────────────────────────────────────────────────────
# │
if [[ "${plugins[@]}" =~ 'kube-ps1' ]]; then
  local kube_prompt='$(kube_ps1)'
else
  local kube_prompt=''
fi

# ╭── 𖹭 PROMPT 𖹭 ──────────────────────────────────────────────────────────────────────────────────
# │
PROMPT="╭─${user_prompt} ${current_dir} ${vcs_prompt}${kube_prompt}
╰─${emoji} "
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="${GRAY}✦ ${ITALIC}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" ${RESET_I}%f${RESET_C}"
ZSH_THEME_GIT_PROMPT_DIRTY="${RESET_I}${RED} ❤︎ ${GRAY}"
ZSH_THEME_GIT_PROMPT_CLEAN="${RESET_I}${GREEN} ☘︎ ${GRAY}"
