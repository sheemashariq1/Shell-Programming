#!/bin/bash
# ============================================================
#  SHELL QUEST - A text-based RPG written in pure Bash
#  Concepts used: case, functions, arrays, $(( )), $RANDOM, while loops, return codes, [[ ]] and (( ))
#  Run:  chmod +x shell_quest.sh && ./shell_quest.sh
# ============================================================

# ---------- GAME STATE (global variables) ----------
HP=100
MAX_HP=100
GOLD=10
ATTACK=8                                   # base damage
INVENTORY=("Rusty Sword" "Healing Potion") # array = backpack
choice=""

# ---------- HELPER FUNCTIONS ----------

# Read user input. If input ends (Ctrl+D), exit cleanly.
read_choice() {
    read -r -p "> " choice || { echo; echo "Bye, adventurer!"; exit 0; }
}

pause() {
    read -r -p "[Press Enter to continue]" _ || exit 0
}

# has_item "Torch"  -> returns 0 (true) if item is in INVENTORY
has_item() {
    local item
    for item in "${INVENTORY[@]}"; do
        [[ "$item" == "$1" ]] && return 0
    done
    return 1
}

# remove_item "Healing Potion" -> removes one copy from INVENTORY
remove_item() {
    local i
    for i in "${!INVENTORY[@]}"; do
        if [[ "${INVENTORY[$i]}" == "$1" ]]; then
            unset 'INVENTORY[i]'
            INVENTORY=("${INVENTORY[@]}")   # re-index the array
            return 0
        fi
    done
    return 1
}

# Heal without going above MAX_HP
heal() {
    HP=$(( HP + $1 > MAX_HP ? MAX_HP : HP + $1 ))
}

show_status() {
    echo "------------------------------------------"
    echo "  HP: $HP/$MAX_HP   Gold: $GOLD   Attack: $ATTACK"
    echo "------------------------------------------"
}

show_inventory() {
    echo
    echo "=== INVENTORY ==="
    local i=1 item
    for item in "${INVENTORY[@]}"; do
        echo "  $i) $item"
        i=$(( i + 1 ))
    done
    echo
}

game_over() {
    echo
    echo "You collapse... GAME OVER."
    echo "Final gold: $GOLD"
    exit 0
}

victory() {
    echo
    echo "*****************************************"
    echo "  The Dragon falls! You saved the realm!"
    echo "  Final gold: $GOLD   HP left: $HP"
    echo "  YOU WIN!"
    echo "*****************************************"
    exit 0
}

# ---------- COMBAT ENGINE ----------
# Usage: combat "Name" enemy_hp enemy_max_damage gold_reward
# Returns 0 if enemy defeated, 1 if player escaped.
combat() {
    local name=$1 ehp=$2 emax=$3 reward=$4
    local dmg edmg

    echo
    echo ">>> A $name appears! (HP: $ehp)"

    while (( ehp > 0 && HP > 0 )); do
        echo
        echo "You: $HP HP   |   $name: $ehp HP"
        echo "1) Attack   2) Use Potion   3) Run"
        read_choice

        case $choice in
            1)
                dmg=$(( ATTACK + RANDOM % 6 ))          # 8..13 base
                if (( RANDOM % 100 < 15 )); then        # 15% crit
                    dmg=$(( dmg * 2 ))
                    echo "CRITICAL HIT!"
                fi
                ehp=$(( ehp - dmg ))
                echo "You hit the $name for $dmg damage."
                ;;
            2)
                if has_item "Healing Potion"; then
                    remove_item "Healing Potion"
                    heal 30
                    echo "You drink a potion. HP is now $HP."
                else
                    echo "No potions left!"
                    continue                            # no enemy turn
                fi
                ;;
            3)
                if (( RANDOM % 2 == 0 )); then
                    echo "You escaped!"
                    return 1
                fi
                echo "You couldn't escape!"
                ;;
            *)
                echo "Invalid choice."
                continue
                ;;
        esac

        # Enemy turn (only if still alive)
        if (( ehp > 0 )); then
            if (( RANDOM % 100 < 20 )); then
                echo "The $name misses!"
            else
                edmg=$(( RANDOM % emax + 1 ))
                HP=$(( HP - edmg ))
                echo "The $name hits you for $edmg damage."
            fi
        fi
    done

    (( HP <= 0 )) && game_over

    GOLD=$(( GOLD + reward ))
    echo "You defeated the $name! +$reward gold."
    return 0
}

# ---------- ROOMS ----------

room_village() {
    local back=0
    while (( ! back )); do
        echo
        echo "=== VILLAGE SHOP ==="
        show_status
        echo "1) Buy Healing Potion (15 gold)"
        echo "2) Buy Steel Sword +5 attack (40 gold)"
        echo "3) Buy Torch (10 gold)"
        echo "4) Rest at Inn, full HP (5 gold)"
        echo "5) Leave"
        read_choice

        case $choice in
            1)
                if (( GOLD >= 15 )); then
                    GOLD=$(( GOLD - 15 ))
                    INVENTORY+=("Healing Potion")
                    echo "Potion bought."
                else echo "Not enough gold."; fi
                ;;
            2)
                if has_item "Steel Sword"; then
                    echo "You already own it."
                elif (( GOLD >= 40 )); then
                    GOLD=$(( GOLD - 40 ))
                    INVENTORY+=("Steel Sword")
                    ATTACK=$(( ATTACK + 5 ))
                    echo "Steel Sword equipped! Attack is now $ATTACK."
                else echo "Not enough gold."; fi
                ;;
            3)
                if has_item "Torch"; then
                    echo "You already own a torch."
                elif (( GOLD >= 10 )); then
                    GOLD=$(( GOLD - 10 ))
                    INVENTORY+=("Torch")
                    echo "Torch bought."
                else echo "Not enough gold."; fi
                ;;
            4)
                if (( GOLD >= 5 )); then
                    GOLD=$(( GOLD - 5 ))
                    HP=$MAX_HP
                    echo "You sleep well. HP restored to $HP."
                else echo "Not enough gold."; fi
                ;;
            5) back=1 ;;
            *) echo "Invalid choice." ;;
        esac
    done
}

room_forest() {
    echo
    echo "=== DARK FOREST ==="
    echo "Branches creak above you..."
    local event=$(( RANDOM % 4 ))
    local found trap

    case $event in
        0) combat "Wolf"   25 6 12 ;;
        1) combat "Goblin" 30 8 18 ;;
        2)
            found=$(( RANDOM % 15 + 5 ))
            GOLD=$(( GOLD + found ))
            echo "You find a hidden chest! +$found gold."
            ;;
        3)
            trap=$(( RANDOM % 10 + 3 ))
            HP=$(( HP - trap ))
            echo "You step on a trap! -$trap HP."
            (( HP <= 0 )) && game_over
            ;;
    esac
}

room_cave() {
    echo
    echo "=== CRYSTAL CAVE ==="
    if ! has_item "Torch"; then
        echo "It is pitch dark inside. You need a Torch (buy one in the village)."
        return
    fi
    if has_item "Dragon Key"; then
        echo "The cave is quiet now. You already have the Dragon Key."
        return
    fi
    echo "Your torch lights up glowing crystals... and a Skeleton Knight!"
    if combat "Skeleton Knight" 45 10 40; then
        INVENTORY+=("Dragon Key")
        echo "You found the Dragon Key!"
    fi
}

room_lair() {
    echo
    echo "=== DRAGON'S LAIR ==="
    if ! has_item "Dragon Key"; then
        echo "A huge iron door blocks the way. It needs a Dragon Key."
        return
    fi
    echo "The door opens. Fire lights the darkness..."
    combat "Dragon" 90 16 0 && victory
}

# ---------- MAIN LOOP ----------
echo "=========================================="
echo "        WELCOME TO SHELL QUEST"
echo "  Goal: get the Dragon Key, slay the Dragon"
echo "=========================================="

while true; do
    echo
    echo "=== WORLD MAP ==="
    show_status
    echo "1) Village   2) Dark Forest   3) Crystal Cave"
    echo "4) Dragon's Lair   5) Inventory   6) Quit"
    read_choice

    case $choice in
        1) room_village ;;
        2) room_forest ;;
        3) room_cave ;;
        4) room_lair ;;
        5) show_inventory; pause ;;
        6) echo "Thanks for playing!"; exit 0 ;;
        *) echo "Invalid choice." ;;
    esac
done