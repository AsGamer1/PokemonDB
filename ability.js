/*
for (let ab = 1; ab < 308; ab++) {
  fetch(`https://pokeapi.co/api/v2/ability/${ab.toString()}`)
  .then(res => res.json())
  .then(data => {
    let effect = "";
    data.flavor_text_entries.forEach(lang => {
      if (lang.language.name == "en") {
        effect = lang.flavor_text
      }
    });
    let name = "";
    data.names.forEach(lang => {
      if (lang.language.name == "en") {
        name = lang.name
      }
    })
    console.log(`(${ab}, "${name}", "${effect}"),`)
  });
}
*/
/*
for (let ab = 1; ab < 308; ab++) {
  fetch(`https://pokeapi.co/api/v2/ability/${ab.toString()}`)
  .then(res => res.json())
  .then(data => {
    data.pokemon.forEach(mon => {
      console.log(`${ab}\t${mon.pokemon.name}\t${mon.is_hidden}`)
    });
  });
}
*/
/*
var url = "https://pokeapi.co/api/v2/pokemon/?limit=1400"

fetch(url)
.then(res=>res.json())
.then(data => {
  for (let pkm in data.results) {
    let poke = data.results[pkm]
    fetch(poke.url)
    .then(res=>res.json())
    .then(data => {
      console.log(data.name, data.height, data.weight, data.id)
    })
  }
})
*/
/*
var url = "https://pokeapi.co/api/v2/pokemon-species?limit=1100"

fetch(url)
.then(res=>res.json())
.then(data => {
  for (let pkm in data.results) {
    let poke = data.results[pkm]
    fetch(poke.url)
    .then(res=>res.json())
    .then(data => {
      let ftes = data.flavor_text_entries
      let entry = ""
      for (let fte in ftes) {
        if (ftes[fte].language.name == "en") {
          entry = ftes[fte].flavor_text
        }
      }
      console.log(`${poke.name}\t${entry}`.replace(/\n/, " ").replace(/\n/, " ").replace(/\n/, " ").replace(/\n/, " ").replace(/\n/, " ").replace(/\n/, " "))
    })
  }
})
*/
/*
var url2 = "https://pokeapi.co/api/v2/evolution-chain/?limit=600"
fetch(url2)
.then(res=>res.json())
.then(data => {
  for (let chain in data.results) {
    let evol = data.results[chain]
    fetch(evol.url)
    .then(res=>res.json())
    .then(data => {
      let init = data.chain.species.name
      console.log(init)
      let cadena = data.chain.evolves_to
      if (cadena != null) {
        for (let cad in cadena) {
          let first = cadena[cad].species.name
          console.log(first, init)
          let cadena2 = cadena[cad].evolves_to
          if (cadena2 != null) {
            for (let cad in cadena2) {
              console.log(cadena2[cad].species.name, first)
            }
          }
        }
      }
      
    })
  }
})
*/
/*
var url = "https://pokeapi.co/api/v2/pokedex?limit=40"
fetch(url)
.then(res=>res.json())
.then(data => {
  for (let dexes = 1; dexes < data.results.length; dexes++) {
    let dex = data.results[dexes]
    fetch(dex.url)
    .then(res=>res.json())
    .then(data => {
      let entries = data.pokemon_entries
      console.log(`${dexes} ${dex.name}`)
      for (let entry in entries) {
        console.log(entries[entry].pokemon_species.name)
      }
    })
  }
})
*/
/*
var url = "https://pokeapi.co/api/v2/type?limit=40"
fetch(url)
.then(res=>res.json())
.then(data => {
  for (let types = 0; types < 17; types ++) {
    let type = data.results[types]
    fetch(type.url)
    .then(res=>res.json())
    .then(data => {
      let dmg_rels = data.damage_relations
      let double_dmg = dmg_rels.double_damage_to
      let half_dmg = dmg_rels.half_damage_to
      let no_dmg = dmg_rels.no_damage_to
      console.log(`#${types} ${type.name}`)
      for (let double in double_dmg) {
        console.log(`2\t${double_dmg[double].name}`)
      }
      for (let half in half_dmg) {
        console.log(`0.5\t${half_dmg[half].name}`)
      }
      for (let no in no_dmg) {
        console.log(`0\t${no_dmg[no].name}`)
      }
    })
  }
})
*/
/*
var url = "https://pokeapi.co/api/v2/pokemon/?limit=1400"

fetch(url)
.then(res=>res.json())
.then(data => {
  for (let pkm in data.results) {
    let poke = data.results[pkm]
    fetch(poke.url)
    .then(res=>res.json())
    .then(data => {
      let mon = data.name
      let stats = [0,0,0,0,0,0]
      for (let stat in data.stats) {
        let stat_json = data.stats[stat]
        switch (stat_json.stat.name) {
          case "hp":
            stats[0] = stat_json.base_stat;
            break;
          case "attack":
            stats[1] = stat_json.base_stat;
            break;
          case "defense":
            stats[2] = stat_json.base_stat;
            break;
          case "special-attack":
            stats[3] = stat_json.base_stat;
            break;
          case "special-defense":
            stats[4] = stat_json.base_stat;
            break;
          case "speed":
            stats[5] = stat_json.base_stat;
            break;
          default:
            break;
        }
      }
      console.log(mon, stats[0], stats[1], stats[2], stats[3], stats[4], stats[5])
    })
  }
})
*/
/*
var url = "https://pokeapi.co/api/v2/pokemon-species?limit=1100"

fetch(url)
.then(res=>res.json())
.then(data => {
  for (let pkm in data.results) {
    let poke = data.results[pkm]
    fetch(poke.url)
    .then(res=>res.json())
    .then(data => {
      let gndr_rate = data.gender_rate
      console.log(`${poke.name}\t${gndr_rate}`)
    })
  }
})
*/
var url = "https://pokeapi.co/api/v2/pokemon/?limit=1400"

fetch(url)
.then(res=>res.json())
.then(data => {
  for (let pkm in data.results) {
    let poke = data.results[pkm]
    fetch(poke.url)
    .then(res=>res.json())
    .then(data => {
      let mon = data.name
      let types = []
      for (let type in data.types) {
        types.push(data.types[type].type.name)
      }
      console.log(mon, types[0], types[1])
    })
  }
})