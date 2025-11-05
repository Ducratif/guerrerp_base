--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
local dialogs = {}

function dialogs.confirmReset(title, content)
    return lib.alertDialog({
        header = title or "🧨 Réinitialiser ?",
        content = content or "Es-tu sûr de vouloir supprimer toutes les compétences ?",
        centered = true,
        cancel = true
    })
end

function dialogs.skillInput(default)
    return lib.inputDialog('🔧 Modifier compétence', {
        { type = 'input', label = 'Description', default = default.description or "" },
        { type = 'input', label = 'Effets (JSON)', default = default.effect or "{}" },
        { type = 'number', label = 'Coût', default = default.cost or 0 }
    })
end

function dialogs.playerSearch()
    return lib.inputDialog('🔍 Recherche Joueur', {
        { type = 'input', label = 'Nom / ID / License', placeholder = 'Ex: Ducratif / license:xxx', required = true }
    })
end

return dialogs

--[[
  GuerreRP - Base publique
  Développé et maintenu par Ducratif

  Discord : https://discord.gg/kpD8pQBBWm
  Documentation : https://github.com/Ducratif/guerrerp

  Merci de ne pas retirer ce crédit si vous utilisez ou modifiez cette ressource.
]]
