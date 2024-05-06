#!/bin/bash

count_electrons() {
    formula="$1"

    # Periodic table
    declare -A elements
    elements[H]=1
    elements[He]=2
    elements[Li]=3
    elements[Be]=4
    elements[B]=5
    elements[C]=6
    elements[N]=7
    elements[O]=8
    elements[F]=9
    elements[Ne]=10
    elements[Na]=11
    elements[Mg]=12
    elements[Al]=13
    elements[Si]=14
    elements[P]=15
    elements[S]=16
    elements[Cl]=17
    elements[Ar]=18
    elements[K]=19
    elements[Ca]=20
    elements[Sc]=21
    elements[Ti]=22
    elements[V]=23
    elements[Cr]=24
    elements[Mn]=25
    elements[Fe]=26
    elements[Co]=27
    elements[Ni]=28
    elements[Cu]=29
    elements[Zn]=30
    elements[Ga]=31
    elements[Ge]=32
    elements[As]=33
    elements[Se]=34
    elements[Br]=35
    elements[Kr]=36
    elements[Rb]=37
    elements[Sr]=38
    elements[Y]=39
    elements[Zr]=40
    elements[Nb]=41
    elements[Mo]=42
    elements[Tc]=43
    elements[Ru]=44
    elements[Rh]=45
    elements[Pd]=46
    elements[Ag]=47
    elements[Cd]=48
    elements[In]=49
    elements[Sn]=50
    elements[Sb]=51
    elements[Te]=52
    elements[I]=53
    elements[Xe]=54
    elements[Cs]=55
    elements[Ba]=56
    elements[La]=57
    elements[Ce]=58
    elements[Pr]=59
    elements[Nd]=60
    elements[Pm]=61
    elements[Sm]=62
    elements[Eu]=63
    elements[Gd]=64
    elements[Tb]=65
    elements[Dy]=66
    elements[Ho]=67
    elements[Er]=68
    elements[Tm]=69
    elements[Yb]=70
    elements[Lu]=71
    elements[Hf]=72
    elements[Ta]=73
    elements[W]=74
    elements[Re]=75
    elements[Os]=76
    elements[Ir]=77
    elements[Pt]=78
    elements[Au]=79
    elements[Hg]=80
    elements[Tl]=81
    elements[Pb]=82
    elements[Bi]=83
    elements[Po]=84
    elements[At]=85
    elements[Rn]=86
    elements[Fr]=87
    elements[Ra]=88
    elements[Ac]=89
    elements[Th]=90
    elements[Pa]=91
    elements[U]=92
    elements[Np]=93
    elements[Pu]=94
    elements[Am]=95
    elements[Cm]=96
    elements[Bk]=97
    elements[Cf]=98
    elements[Es]=99
    elements[Fm]=100
    elements[Md]=101
    elements[No]=102
    elements[Lr]=103
    elements[Rf]=104
    elements[Db]=105
    elements[Sg]=106
    elements[Bh]=107
    elements[Hs]=108
    elements[Mt]=109
    elements[Ds]=110
    elements[Rg]=111
    elements[Cn]=112
    elements[Nh]=113
    elements[Fl]=114
    elements[Mc]=115
    elements[Lv]=116
    elements[Ts]=117
    elements[Og]=118

    total_electrons=0
    current_element=""
    current_count="1"  # Default count if not specified

    for (( i=0; i<${#formula}; i++ )); do
        char="${formula:$i:1}"
        if [[ $char =~ [A-Za-z] ]]; then
            # If there was a previous element, add its count to total electrons
            if [[ -n $current_element ]]; then
                total_electrons=$(( total_electrons + elements[$current_element] * (current_count ? current_count : 1) ))
            fi
            current_element="$char"
            # If the next character is lowercase, add it to the current element
            if [[ $((i+1)) -lt ${#formula} && ${formula:$((i+1)):1} =~ [a-z] ]]; then
                current_element="${current_element}${formula:$((i+1)):1}"
                ((i++))  # Skip the next character
            fi
            current_count=""  # Reset count for the next element
        elif [[ $char =~ [0-9] ]]; then
            # If the count is already set, append the digit to it
            if [[ -n $current_count ]]; then
                current_count="${current_count}${char}"
            else
                current_count="${char}"
            fi
        else
            echo "Invalid character in formula: $char"
            exit 1
        fi
    done

    # Add count of the last element
    total_electrons=$(( total_electrons + elements[$current_element] * (current_count ? current_count : 1) ))

    echo $total_electrons
}

# Main script

echo -n "Enter chemical formula: "
read formula

total_electrons=$(count_electrons "$formula")
echo "Total number of electrons: $total_electrons"
