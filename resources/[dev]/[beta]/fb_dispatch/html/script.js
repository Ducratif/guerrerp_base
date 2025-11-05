// Variables globales pour le drag and drop custom
let isDragging = false;
let draggedAgent = null;
let dragGhost = null;
let dragOffset = { x: 0, y: 0 };

// DOM Content Loaded Event
document.addEventListener('DOMContentLoaded', function() {
    
    // Initialize UI Components
    initializeInventory();
    initializePromptSystem();
    initializeVehicleShop();
    initializeCharacterCustomization();
    initializeControlsHelp();
    initializeMedicalSystem();
    initializeDispatchSystem();
});

// Inventory System
function initializeInventory() {
    const inventoryItems = document.querySelectorAll('.inventory .item');
    const weaponAccessories = document.querySelectorAll('.weapon-container .case');
    const craftButton = document.querySelector('.craft');
    
    // Add click events to inventory items
    inventoryItems.forEach(item => {
        item.addEventListener('click', function() {
            selectInventoryItem(this);
        });
        
        // Remplacé par le système custom pour FiveM
        item.addEventListener('mousedown', function(e) {
            startCustomDrag(e, this, this.dataset.itemId || 'item');
        });
    });
    
    // Add drop zones for weapon accessories
    weaponAccessories.forEach(accessory => {
        accessory.addEventListener('mouseup', function(e) {
            handleCustomDrop(e, this, 'accessory');
        });
    });
    
    // Craft button functionality
    if (craftButton) {
        craftButton.addEventListener('click', function() {
            showCraftingMenu();
        });
    }
}

function selectInventoryItem(item) {
    // Remove previous selections
    document.querySelectorAll('.inventory .item.selected').forEach(el => {
        el.classList.remove('selected');
    });
    
    // Add selection to clicked item
    item.classList.add('selected');
    
    // Show item details
    showItemDetails(item);
}

function showItemDetails(item) {
    const itemName = item.querySelector('.name').textContent;
    const itemAmount = item.querySelector('.amount').textContent;
    
    console.log(`Selected: ${itemName} (${itemAmount})`);
}

function attachAccessory(slot, itemData) {
    slot.classList.add('equipped');
    console.log(`Attached ${itemData} to ${slot.className}`);
}

function showCraftingMenu() {
    console.log('Opening crafting menu...');
}

// Prompt System
function initializePromptSystem() {
    const promptButtons = document.querySelectorAll('.prompt-button');
    const slider = document.querySelector('.slider-input');
    const selectMenu = document.querySelector('.select-menu .select');
    
    // Prompt buttons
    promptButtons.forEach(button => {
        button.addEventListener('click', function() {
            handlePromptAction(this);
        });
    });
    
    // Slider
    if (slider) {
        slider.addEventListener('input', function() {
            updateSliderValue(this.value);
        });
    }
    
    // Select menu
    if (selectMenu) {
        selectMenu.addEventListener('click', function() {
            toggleSelectOptions(this);
        });
    }
}

function handlePromptAction(button) {
    const action = button.textContent.trim();
    console.log(`Prompt action: ${action}`);
    
    if (action === 'Confirmer') {
        confirmPrompt();
    } else if (action === 'Annuler') {
        cancelPrompt();
    }
}

function updateSliderValue(value) {
    document.querySelector('.label-arrow').textContent = value;
}

function toggleSelectOptions(select) {
    const options = select.parentElement.querySelector('.options');
    options.style.display = options.style.display === 'block' ? 'none' : 'block';
}

function confirmPrompt() {
    console.log('Prompt confirmed');
}

function cancelPrompt() {
    console.log('Prompt cancelled');
}

// Vehicle Shop
function initializeVehicleShop() {
    const vehicleCards = document.querySelectorAll('.vehicle-card');
    
    vehicleCards.forEach(card => {
        card.addEventListener('click', function() {
            selectVehicle(this);
        });
        
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-8px)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(-5px)';
        });
    });
}

function selectVehicle(card) {
    // Remove previous selections
    document.querySelectorAll('.vehicle-card.selected').forEach(el => {
        el.classList.remove('selected');
    });
    
    // Add selection
    card.classList.add('selected');
    
    const vehicleName = card.querySelector('h3').textContent;
    const vehiclePrice = card.querySelector('.price').textContent;
    
    console.log(`Selected vehicle: ${vehicleName} - ${vehiclePrice}`);
    
    // Add visual feedback
    card.style.border = '2px solid var(--global-main-color)';
    setTimeout(() => {
        card.style.border = '';
    }, 2000);
}

// Character Customization
function initializeCharacterCustomization() {
    const faceOptions = document.querySelectorAll('.face-option');
    const clothingItems = document.querySelectorAll('.clothing-item');
    
    // Face selection
    faceOptions.forEach(face => {
        face.addEventListener('click', function() {
            selectFace(this);
        });
    });
    
    // Clothing selection
    clothingItems.forEach(item => {
        item.addEventListener('click', function() {
            selectClothing(this);
        });
    });
}

function selectFace(face) {
    // Remove previous selections
    document.querySelectorAll('.face-option.selected').forEach(el => {
        el.classList.remove('selected');
    });
    
    // Add selection
    face.classList.add('selected');
    face.style.borderColor = 'var(--global-main-color)';
    
    console.log('Face selected:', face.alt);
}

function selectClothing(item) {
    const clothingType = item.querySelector('span').textContent;
    console.log(`Selected clothing: ${clothingType}`);
    
    // Visual feedback
    item.style.backgroundColor = 'var(--global-main-color-60)';
    setTimeout(() => {
        item.style.backgroundColor = '';
    }, 1000);
}

// Controls Help
function initializeControlsHelp() {
    const controlItems = document.querySelectorAll('.control-item');
    
    controlItems.forEach(item => {
        item.addEventListener('mouseenter', function() {
            showControlTooltip(this);
        });
        
        item.addEventListener('mouseleave', function() {
            hideControlTooltip();
        });
    });
}

function showControlTooltip(item) {
    const controlName = item.querySelector('span').textContent;
    console.log(`Control: ${controlName}`);
}

function hideControlTooltip() {
    // Hide tooltip implementation
}

// Medical System
function initializeMedicalSystem() {
    const bodyParts = document.querySelectorAll('.body-part');
    const skeletonImage = document.querySelector('.skeleton-image');
    
    bodyParts.forEach(part => {
        part.addEventListener('click', function() {
            showBodyPartDetails(this);
        });
    });
    
    if (skeletonImage) {
        skeletonImage.addEventListener('click', function(e) {
            handleSkeletonClick(e);
        });
    }
}

// Dispatch System
function initializeDispatchSystem() {
    // Initialize tabs
    const dispatchTabs = document.querySelectorAll('.dispatch-container .menu .tab');
    
    // Tab switching
    dispatchTabs.forEach((tab, index) => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            // Remove active class from all tabs
            dispatchTabs.forEach(t => t.classList.remove('selected'));
            
            // Hide all sections
            const allSections = document.querySelectorAll('.dispatch-container .list, .dispatch-container .squads');
            allSections.forEach(section => section.style.display = 'none');
            
            // Add active class to clicked tab
            this.classList.add('selected');
            
            // Show corresponding content based on tab text
            const tabText = this.textContent.trim();
            
            switch(tabText) {
                case 'Notifications':
                    // Show call cards list
                    const notificationsList = document.querySelector('.dispatch-container .list:not(.squads):not(.wanted)');
                    if (notificationsList) {
                        notificationsList.style.display = 'flex';
                    }
                    
                    // Explicitly hide wanted section
                    const wantedSectionNotif = document.querySelector('.dispatch-container .list.wanted');
                    if (wantedSectionNotif) {
                        wantedSectionNotif.style.display = 'none';
                    }
                    break;
                    
                case 'Unités':
                    // Show squads section - Force display with multiple methods
                    const squadsSection = document.querySelector('.dispatch-container .squads');
                    if (squadsSection) {
                        squadsSection.style.display = 'flex';
                        squadsSection.style.visibility = 'visible';
                        squadsSection.style.opacity = '1';
                        
                        // Also ensure the inner list is visible
                        const squadsList = squadsSection.querySelector('.list.squads');
                        if (squadsList) {
                            squadsList.style.display = 'flex';
                            squadsList.style.visibility = 'visible';
                            squadsList.style.opacity = '1';
                        }
                        
                        // Make sure squad cards are visible
                        const squadCards = squadsSection.querySelectorAll('.squads-card, .new-squad');
                        squadCards.forEach(card => {
                            card.style.display = 'flex';
                            card.style.visibility = 'visible';
                            card.style.opacity = '1';
                        });
                    }
                    
                    // Explicitly hide wanted section
                    const wantedSectionUnits = document.querySelector('.dispatch-container .list.wanted');
                    if (wantedSectionUnits) {
                        wantedSectionUnits.style.display = 'none';
                    }
                    break;
                    
                case 'Recherchés':
                    // Force display wanted section with multiple methods
                    const wantedList = document.querySelector('.dispatch-container .list.wanted');
                    if (wantedList) {
                        wantedList.style.display = 'flex';
                        wantedList.style.visibility = 'visible';
                        wantedList.style.opacity = '1';
                        
                        // Also ensure the wanted categories and cards are visible
                        const wantedCategories = wantedList.querySelectorAll('.wanted-category .list, .wanted-category-civil .list, .wanted-category-vehicule .list');
                        wantedCategories.forEach(categoryList => {
                            categoryList.style.display = 'flex';
                            categoryList.style.height = 'auto';
                            categoryList.style.opacity = '1';
                            categoryList.classList.add('expand');
                        });
                        
                        const wantedCards = wantedList.querySelectorAll('.wanted-card');
                        wantedCards.forEach(card => {
                            card.style.display = 'flex';
                            card.style.visibility = 'visible';
                            card.style.opacity = '1';
                        });
                    }
                    break;
            }
        });
        
        // Simple hover effect
        tab.addEventListener('mouseenter', function() {
            if (!this.classList.contains('selected')) {
                this.style.background = 'var(--black2-60)';
            }
        });
        
        tab.addEventListener('mouseleave', function() {
            if (!this.classList.contains('selected')) {
                this.style.background = '';
            }
        });
        
        // Ensure tabs are clickable
        tab.style.pointerEvents = 'auto';
        tab.style.userSelect = 'none';
        tab.style.zIndex = '10';
    });
    
    
    // Initialize FiveM-compatible drag and drop system

    // Initialize agent drag functionality with a small delay to ensure DOM is ready
    setTimeout(() => {
        initializeAgentDragDrop();
        initializeSquadTitleEditing();
        // Ensure "En Service" is always last (before "new-squad") on page load
        ensureEnServiceLast();
        
        // Réessayer d'initialiser les boutons backup après un délai
        initializeBackupButtons();
    }, 100);
    
    // Dispatch header buttons (excluding notifications)
    const dispatchButtons = document.querySelectorAll('.dispatch-header .action-button:not(.notif)');
    dispatchButtons.forEach(button => {
        button.addEventListener('click', function() {
            handleDispatchAction(this);
        });
    });
    
    // Backup buttons initialization will be handled by initializeBackupButtons()
    
    // Status menu
    const statusItems = document.querySelectorAll('.status-item');
    statusItems.forEach(item => {
        item.addEventListener('click', function() {
            changeSquadStatus(this);
        });
    });
    
    // Wanted list interactions
    const wantedCards = document.querySelectorAll('.wanted-card');
    wantedCards.forEach(card => {
        const editBtn = card.querySelector('.buttons img[alt="edit"]');
        const deleteBtn = card.querySelector('.buttons img[alt="delete"]');
        
        // Edit button functionality
        if (editBtn) {
            editBtn.addEventListener('click', function() {
                editWantedPerson(card);
            });
        }
        
        // Delete button functionality
        if (deleteBtn) {
            deleteBtn.addEventListener('click', function() {
                deleteWantedPerson(card);
            });
        }
        
        // Direct double-click on elements to edit
        const titleDiv = card.querySelector('.title');
        const reasonDiv = card.querySelector('.reason');
        const descriptionDiv = card.querySelector('.description');
        
        if (titleDiv) {
            titleDiv.addEventListener('dblclick', function() {
                makeElementEditable(this);
            });
        }
        
        if (reasonDiv) {
            reasonDiv.addEventListener('dblclick', function() {
                makeElementEditable(this);
            });
        }
        
        if (descriptionDiv) {
            descriptionDiv.addEventListener('dblclick', function() {
                makeElementEditable(this);
            });
        }
    });
    
    // Search functionality - enhanced
    const searchBar = document.querySelector('.wanted .search-bar input');
    if (searchBar) {
        // Real-time search as you type
        searchBar.addEventListener('input', function() {
            filterWantedList(this.value);
        });
        
        // Also search on Enter key
        searchBar.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                filterWantedList(this.value);
            }
        });
        
        // Clear search when input is cleared
        searchBar.addEventListener('keyup', function() {
            if (this.value === '') {
                filterWantedList('');
            }
        });
        
        console.log('Search functionality initialized');
    } else {
        console.error('Search bar not found');
    }
    
    // Wanted categories expand/collapse functionality
    const expandButtons = document.querySelectorAll('.wanted-category .header .expand, .wanted-category-civil .header .expand, .wanted-category-vehicule .header .expand');
    
    // Set initial state - all categories should be expanded by default
    expandButtons.forEach(button => {
        const category = button.closest('.wanted-category, .wanted-category-civil, .wanted-category-vehicule');
        const categoryList = category.querySelector('.list');
        if (categoryList) {
            categoryList.classList.add('expand');
            button.classList.remove('rotate'); // Flèche vers le bas = ouvert
            categoryList.style.cssText = 'display: flex !important; visibility: visible !important; opacity: 1 !important; height: auto !important; margin-top: .5vh !important;';
        }
    });
    
    expandButtons.forEach(button => {
        button.addEventListener('click', function() {
            const category = this.closest('.wanted-category, .wanted-category-civil, .wanted-category-vehicule');
            const categoryList = category.querySelector('.list');
            
            if (categoryList) {
                // Check current state - if expanded, collapse it
                const isExpanded = categoryList.classList.contains('expand');
                
                if (isExpanded) {
                    // Collapse - flèche vers la droite
                    categoryList.classList.remove('expand');
                    this.classList.add('rotate');
                    categoryList.style.cssText = 'display: none !important; visibility: hidden !important; opacity: 0 !important; height: 0 !important; margin-top: 0 !important;';
                } else {
                    // Expand - flèche vers le bas
                    categoryList.classList.add('expand');
                    this.classList.remove('rotate');
                    categoryList.style.cssText = 'display: flex !important; visibility: visible !important; opacity: 1 !important; height: auto !important; margin-top: .5vh !important;';
                }
            }
        });
    });
    
    // Initialize context menu actions
    initializeContextMenu();
    
    // Initialize call card interactions (click and right-click)
    initializeCallCardEvents();
    
    // Initialize default tab view
    initializeDefaultTabView();
    
    // Initialize real-time updates
    initializeDispatchUpdates();
}

function initializeDefaultTabView() {
    // Hide all sections first
    const allSections = document.querySelectorAll('.dispatch-container .list, .dispatch-container .squads');
    allSections.forEach(section => section.style.display = 'none');
    
    // Show the default tab content (first selected tab or Notifications)
    const selectedTab = document.querySelector('.dispatch-container .menu .tab.selected') || 
                       document.querySelector('.dispatch-container .menu .tab');
    
    if (selectedTab) {
        selectedTab.classList.add('selected');
        const tabText = selectedTab.textContent.trim();
        
        switch(tabText) {
            case 'Notifications':
                const notificationsList = document.querySelector('.dispatch-container .list:not(.squads):not(.wanted)');
                if (notificationsList) {
                    notificationsList.style.display = 'flex';
                }
                
                // Explicitly hide wanted section
                const wantedSectionDefault = document.querySelector('.dispatch-container .list.wanted');
                if (wantedSectionDefault) {
                    wantedSectionDefault.style.display = 'none';
                }
                break;
                
            case 'Unités':
                // Force display squads section with multiple methods
                const squadsSection = document.querySelector('.dispatch-container .squads');
                if (squadsSection) {
                    squadsSection.style.display = 'flex';
                    squadsSection.style.visibility = 'visible';
                    squadsSection.style.opacity = '1';
                    
                    // Also ensure the inner list is visible
                    const squadsList = squadsSection.querySelector('.list.squads');
                    if (squadsList) {
                        squadsList.style.display = 'flex';
                        squadsList.style.visibility = 'visible';
                        squadsList.style.opacity = '1';
                    }
                    
                    // Make sure squad cards are visible
                    const squadCards = squadsSection.querySelectorAll('.squads-card, .new-squad');
                    squadCards.forEach(card => {
                        card.style.display = 'flex';
                        card.style.visibility = 'visible';
                        card.style.opacity = '1';
                    });
                }
                
                // Explicitly hide wanted section
                const wantedSectionDefaultUnits = document.querySelector('.dispatch-container .list.wanted');
                if (wantedSectionDefaultUnits) {
                    wantedSectionDefaultUnits.style.display = 'none';
                }
                break;
                
            case 'Recherchés':
                // Force display wanted section with multiple methods
                const wantedList = document.querySelector('.dispatch-container .list.wanted');
                if (wantedList) {
                    wantedList.style.display = 'flex';
                    wantedList.style.visibility = 'visible';
                    wantedList.style.opacity = '1';
                    
                    // Also ensure the wanted categories and cards are visible
                    const wantedCategories = wantedList.querySelectorAll('.wanted-category .list, .wanted-category-civil .list, .wanted-category-vehicule .list');
                    wantedCategories.forEach(categoryList => {
                        categoryList.style.display = 'flex';
                        categoryList.style.height = 'auto';
                        categoryList.style.opacity = '1';
                        categoryList.classList.add('expand');
                    });
                    
                    const wantedCards = wantedList.querySelectorAll('.wanted-card');
                    wantedCards.forEach(card => {
                        card.style.display = 'flex';
                        card.style.visibility = 'visible';
                        card.style.opacity = '1';
                    });
                }
                break;
        }
    }
}

// Dispatch Functions
function selectCallCard(card) {
    // Remove selection from other cards
    document.querySelectorAll('.call-card').forEach(c => c.classList.remove('selected'));
    
    // Select current card
    card.classList.add('selected');
    
    // Update details panel
    updateCallDetails(card);
    
    console.log('Call selected:', card.querySelector('.title span')?.textContent);
}

function showCallContextMenu(event, card) {
    const contextMenu = document.querySelector('.right-clic');
    
    if (contextMenu) {
        // Position the context menu at cursor position
        contextMenu.style.display = 'flex';
        contextMenu.style.position = 'fixed';
        contextMenu.style.left = event.clientX + 'px';
        contextMenu.style.top = event.clientY + 'px';
        contextMenu.style.zIndex = '9999';
        
        // Store reference to the selected call card
        const cardTitle = card.querySelector('.title span')?.textContent || 'Appel';
        contextMenu.dataset.selectedCard = cardTitle;
        
        // Hide when clicking elsewhere
        document.addEventListener('click', hideContextMenu);
        
        // Hide after 5 seconds
        setTimeout(() => {
            hideContextMenu();
        }, 5000);
    }
}

function hideContextMenu() {
    const contextMenu = document.querySelector('.right-clic');
    if (contextMenu) {
        contextMenu.style.display = 'none';
        document.removeEventListener('click', hideContextMenu);
    }
}

function initializeContextMenu() {
    const contextMenuButtons = document.querySelectorAll('.right-clic .clic-hover, .right-clic .call');
    
    contextMenuButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            handleContextMenuAction(this);
            hideContextMenu();
        });
    });
}

function initializeCallCardEvents() {
    const callCards = document.querySelectorAll('.call-card');
    
    callCards.forEach(card => {
        setupCallCardEvents(card);
    });
}

function setupCallCardEvents(card) {
    // Skip if events already attached
    if (card.hasAttribute('data-events-attached')) {
        return;
    }
    
    // Left click - select the card
    card.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        selectCallCard(this);
    });
    
    // Right click - show context menu
    card.addEventListener('contextmenu', function(e) {
        e.preventDefault();
        e.stopPropagation();
        showCallContextMenu(e, this);
    });
    
    // Ensure the card is clickable
    card.style.cursor = 'pointer';
    card.style.pointerEvents = 'auto !important';
    card.style.position = 'relative';
    card.style.zIndex = '10';
    
    // Mark as having events attached
    card.setAttribute('data-events-attached', 'true');
}

function handleContextMenuAction(button) {
    const contextMenu = document.querySelector('.right-clic');
    const callTitle = contextMenu.dataset.selectedCard || 'Appel';
    const actionText = button.querySelector('span')?.textContent || 'Action';
    
    switch(actionText) {
        case 'Prendre l\'appel':
            takeCall(callTitle);
            break;
        case 'Assigner équipe':
            assignTeam(callTitle);
            break;
        case 'Fermer appel':
            closeCall(callTitle);
            break;
        case 'Supprimer touts les appels':
            deleteAllCalls();
            break;
        default:
            console.log('Action non reconnue:', actionText);
    }
}

function takeCall(callTitle) {
    const detailedMessage = `
        <div style="display: flex; align-items: center;">
            <img src="build/media/character.9660637ee832a8de6d18255cc4808638.svg" alt="agent" style="width: 14px; height: 14px; margin-right: 8px; opacity: 0.8;">
            <span>Vous avez pris en charge: <strong>${callTitle}</strong></span>
        </div>
    `;
    
    showDispatchNotification(
        'Appel pris en charge',
        detailedMessage,
        'blue',
        true
    );
    
    // Add Alpha 2 to the call squads
    const callCards = document.querySelectorAll('.call-card');
    callCards.forEach(card => {
        const title = card.querySelector('.title span')?.textContent;
        if (title === callTitle) {
            const callSquads = card.querySelector('.call-squads');
            if (callSquads) {
                // Create new squad element
                const newSquad = document.createElement('p');
                newSquad.textContent = 'Alpha 2';
                callSquads.appendChild(newSquad);
            }
        }
    });
    
    console.log('Call taken:', callTitle);
}

function assignTeam(callTitle) {
    const detailedMessage = `
        <div style="display: flex; align-items: center;">
            <img src="build/media/player.0ba8bc6495d555073e78453185f97899.svg" alt="team" style="width: 14px; height: 14px; margin-right: 8px; opacity: 0.8;">
            <span>Sélectionnez une équipe pour: <strong>${callTitle}</strong></span>
        </div>
    `;
    
    showDispatchNotification(
        'Attribution d\'équipe',
        detailedMessage,
        'orange',
        true
    );
    
    // Highlight available teams
    const teamCards = document.querySelectorAll('.squads-card');
    teamCards.forEach(card => {
        const status = card.querySelector('.status');
        if (status && (status.textContent === 'LIBRE' || status.classList.contains('green'))) {
            card.style.border = '2px solid var(--orange)';
            card.style.animation = 'pulse 1s infinite';
            
            // Remove highlight after 3 seconds
            setTimeout(() => {
                card.style.border = '';
                card.style.animation = '';
            }, 3000);
        }
    });
    
    console.log('Assign team to call:', callTitle);
}

function closeCall(callTitle) {
    const detailedMessage = `
        <div style="display: flex; align-items: center;">
            <img src="build/media/cross.941e01b75254f98d9a2e2950c3cb3bcf.svg" alt="close" style="width: 14px; height: 14px; margin-right: 8px; opacity: 0.8;">
            <span>L'appel "<strong>${callTitle}</strong>" a été fermé</span>
        </div>
    `;
    
    showDispatchNotification(
        'Appel fermé',
        detailedMessage,
        'red',
        true
    );
    
    // Remove the call card
    const callCards = document.querySelectorAll('.call-card');
    callCards.forEach(card => {
        const title = card.querySelector('.title span')?.textContent;
        if (title === callTitle) {
            card.style.animation = 'fadeOut 0.5s ease';
            setTimeout(() => {
                card.remove();
            }, 500);
        }
    });
    
    console.log('Call closed:', callTitle);
}

function deleteAllCalls() {
    // Find all call cards in the notifications list
    const notificationsList = document.querySelector('.dispatch-container .list:not(.squads):not(.wanted)');
    const allCallCards = notificationsList ? notificationsList.querySelectorAll('.call-card') : [];
    
    if (allCallCards.length === 0) {
        showDispatchNotification(
            'Aucun appel',
            'Il n\'y a aucun appel à supprimer',
            'orange',
            false
        );
        return;
    }
    
    const callCount = allCallCards.length;
    
    // Add animation and remove all call cards
    allCallCards.forEach((card, index) => {
        // Stagger the animation for visual effect
        setTimeout(() => {
            card.style.animation = 'fadeOut 0.3s ease';
            setTimeout(() => {
                card.remove();
            }, 300);
        }, index * 50); // 50ms delay between each card
    });
    
    // Show confirmation notification
    const detailedMessage = `
        <div style="display: flex; align-items: center;">
            <img src="build/media/cross.941e01b75254f98d9a2e2950c3cb3bcf.svg" alt="delete" style="width: 14px; height: 14px; margin-right: 8px; opacity: 0.8;">
            <span><strong>${callCount}</strong> appel${callCount > 1 ? 's ont été supprimés' : ' a été supprimé'}</span>
        </div>
    `;
    
    showDispatchNotification(
        'Tous les appels supprimés',
        detailedMessage,
        'red',
        true
    );
    
    console.log(`Deleted ${callCount} call cards`);
}

function assignSquadToCall(squad, callData) {
    squad.classList.remove('over');
    
    // Update squad status
    const statusElement = squad.querySelector('.status');
    if (statusElement) {
        statusElement.textContent = 'EN ROUTE';
        statusElement.className = 'status orange';
    }
    
    // Add notification
    const detailedMessage = `
        <div style="display: flex; align-items: center;">
            <img src="build/media/check.02fc1e98ef41af44a20bde768d4a10f1.svg" alt="assigned" style="width: 14px; height: 14px; margin-right: 8px; opacity: 0.8;">
            <span>Équipe assignée à l'appel avec succès</span>
        </div>
    `;
    
    showDispatchNotification('Équipe assignée', detailedMessage, 'blue', true);
    
    console.log('Squad assigned to call:', squad, callData);
}

function moveAgentToSquad(agentId, targetSquad) {
    console.log(`Attempting to move agent ${agentId} to squad`);
    
    // Find the agent being moved
    const agentElement = document.querySelector(`.agent-card[data-agent-id="${agentId}"]`);
    if (!agentElement) {
        console.error('Agent not found:', agentId);
        return;
    }
    
    console.log('Agent element found:', agentElement);
    
    // Get agent information
    const agentName = agentElement.dataset.agentName;
    
    // Get source and target squad names
    const sourceSquad = agentElement.closest('.squads-card');
    const sourceSquadName = sourceSquad ? sourceSquad.dataset.squadName || 'Squad inconnu' : 'Squad inconnu';
    const targetSquadName = targetSquad.dataset.squadName || 'Squad inconnu';
    
    // Prevent moving to the same squad
    if (sourceSquad === targetSquad) {
        console.log('Agent is already in this squad');
        return;
    }
    
    // Remove agent from current squad
    agentElement.remove();
    
    // Remove empty message from target squad if it exists
    removeEmptySquadMessage(targetSquad);
    
    // Add agent to target squad
    targetSquad.appendChild(agentElement);
    
    // Check if source squad is now empty and should be deleted
    checkAndDeleteEmptySquad(sourceSquad);
    
    // Reinitialize all drag and drop functionality
    initializeAgentDragDrop();
    initializeSquadTitleEditing();
    
    // Ensure no agents remain selected/focused
    clearAllAgentSelections();
    
    // Show notification
    const detailedMessage = `
        <div style="display: flex; align-items: center;">
            <img src="build/media/character.9660637ee832a8de6d18255cc4808638.svg" alt="agent" style="width: 14px; height: 14px; margin-right: 8px; opacity: 0.8;">
            <span><strong>${agentName}</strong> déplacé de <em>${sourceSquadName}</em> vers <em>${targetSquadName}</em></span>
        </div>
    `;
    
    showDispatchNotification(
        'Agent déplacé',
        detailedMessage,
        'blue',
        true
    );
    
    console.log(`Agent ${agentName} moved from ${sourceSquadName} to ${targetSquadName}`);
}

function checkAndDeleteEmptySquad(squad) {
    if (!squad) return;
    
    const squadName = squad.dataset.squadName;
    
    // Never delete the "En Service" squad
    if (squadName === 'En Service') {
        console.log('Squad "En Service" is protected from deletion');
        
        // Add a visual indicator that it's empty but protected
        const remainingAgents = squad.querySelectorAll('.agent-card');
        if (remainingAgents.length === 0) {
            // Add an empty message to the En Service squad
            addEmptySquadMessage(squad);
        }
        return;
    }
    
    // Count remaining agents in the squad
    const remainingAgents = squad.querySelectorAll('.agent-card');
    
    if (remainingAgents.length === 0) {
        console.log(`Squad "${squadName}" is empty, deleting it...`);
        
        // Show notification before deletion
        const detailedMessage = `
            <div style="display: flex; align-items: center;">
                <img src="build/media/cross.941e01b75254f98d9a2e2950c3cb3bcf.svg" alt="delete" style="width: 14px; height: 14px; margin-right: 8px; opacity: 0.8;">
                <span>Équipe <em>${squadName}</em> supprimée (plus d'agents)</span>
            </div>
        `;
        
        showDispatchNotification(
            'Équipe supprimée',
            detailedMessage,
            'orange',
            true
        );
        
        // Add fade out animation and then remove
        squad.style.transition = 'opacity 0.3s ease';
        squad.style.opacity = '0';
        
        setTimeout(() => {
            squad.remove();
            // Squad drag and drop is automatically handled by FiveM system
            initializeSquadTitleEditing();
        }, 300);
    }
}

function addEmptySquadMessage(squad) {
    // Remove any existing empty message
    const existingMessage = squad.querySelector('.empty-squad-message');
    if (existingMessage) {
        existingMessage.remove();
    }
    
    // Add empty message only if there are no agents
    const agents = squad.querySelectorAll('.agent-card');
    if (agents.length === 0) {
        const emptyMessage = document.createElement('div');
        emptyMessage.className = 'card empty-squad-message';
        emptyMessage.style.opacity = '0.6';
        emptyMessage.style.fontStyle = 'italic';
        emptyMessage.innerHTML = `
            <img src="build/media/character.9660637ee832a8de6d18255cc4808638.svg" alt="empty" style="opacity: 0.3;">
            <span>Aucun agent assigné</span>
        `;
        squad.appendChild(emptyMessage);
    }
}

function removeEmptySquadMessage(squad) {
    const emptyMessage = squad.querySelector('.empty-squad-message');
    if (emptyMessage) {
        emptyMessage.remove();
    }
}

function isSquadProtected(squadName) {
    // List of squads that cannot be deleted
    const protectedSquads = ['En Service'];
    return protectedSquads.includes(squadName);
}

function deleteSquad(squad) {
    // Public function to delete a squad with protection check
    if (!squad) {
        console.error('No squad provided for deletion');
        return false;
    }
    
    const squadName = squad.dataset.squadName;
    
    // Check if squad is protected
    if (isSquadProtected(squadName)) {
        const detailedMessage = `
            <div style="display: flex; align-items: center;">
                <img src="build/media/warning.8f4b28ee3dd8c2a7f7a5b35c7d6b4f1c.svg" alt="warning" style="width: 14px; height: 14px; margin-right: 8px; opacity: 0.8;">
                <span>L'équipe <em>${squadName}</em> ne peut pas être supprimée</span>
            </div>
        `;
        
        showDispatchNotification(
            'Action interdite',
            detailedMessage,
            'red',
            true
        );
        
        console.log(`Squad "${squadName}" is protected and cannot be deleted`);
        return false;
    }
    
    // Force delete the squad
    checkAndDeleteEmptySquad(squad);
    return true;
}

function initializeAgentDragDrop() {
    console.log('Initializing FiveM-compatible agent drag and drop...');
    
    // Utiliser la délégation d'événements sur le conteneur parent
    const squadsContainer = document.querySelector('.list.squads');
    if (squadsContainer) {
        // Supprimer les anciens événements s'il y en a
        squadsContainer.removeEventListener('mousedown', handleAgentMouseDown);
        
        // Ajouter le gestionnaire d'événements mousedown
        squadsContainer.addEventListener('mousedown', handleAgentMouseDown);
        console.log('FiveM drag system initialized');
    }
    
    // Ajouter les événements globaux pour le drag
    document.removeEventListener('mousemove', handleGlobalMouseMove);
    document.removeEventListener('mouseup', handleGlobalMouseUp);
    document.addEventListener('mousemove', handleGlobalMouseMove);
    document.addEventListener('mouseup', handleGlobalMouseUp);
}

function clearAllAgentSelections() {
    const allAgentCards = document.querySelectorAll('.agent-card');
    allAgentCards.forEach(card => {
        card.blur();
        card.classList.remove('selected', 'active', 'dragging', 'focus');
        // Also remove focus styles
        card.style.outline = 'none';
    });
    
    // Also clear any squad hover effects
    const allSquadCards = document.querySelectorAll('.squads-card, .new-squad');
    allSquadCards.forEach(card => {
        card.classList.remove('over');
    });
    
    console.log('🧹 All agent selections cleared');
}

function initializeSquadTitleEditing() {
    console.log('Initializing squad title editing...');
    
    // Find all squad cards and setup their edit buttons
    const squadCards = document.querySelectorAll('.squads-card');
    squadCards.forEach(card => {
        setupSquadEditButton(card);
    });
}

function setupSquadEditButton(squadCard) {
    const editButton = squadCard.querySelector('.btn[title*="Modifier"], .btn[title*="Options"]');
    const titleInput = squadCard.querySelector('.title-edit');
    
    if (!editButton || !titleInput) {
        return;
    }
    
    // Check if this is a protected squad (like "En Service")
    const squadName = squadCard.dataset.squadName;
    if (isSquadProtected(squadName)) {
        // Hide edit button for protected squads
        editButton.style.display = 'none';
        titleInput.classList.remove('editable');
        titleInput.readOnly = true;
        return;
    }
    
    // Remove existing listeners to prevent duplicates
    editButton.removeEventListener('click', handleSquadEditClick);
    
    // Add click handler
    editButton.addEventListener('click', handleSquadEditClick);
    
    // Ensure the input is disabled by default
    titleInput.classList.remove('editable');
    titleInput.readOnly = true;
}

function handleSquadEditClick(e) {
    e.preventDefault();
    e.stopPropagation();
    
    const button = e.currentTarget;
    const squadCard = button.closest('.squads-card');
    const titleInput = squadCard.querySelector('.title-edit');
    
    if (!titleInput) return;
    
    const isCurrentlyEditable = titleInput.classList.contains('editable');
    
    if (isCurrentlyEditable) {
        // Save and exit edit mode (without handlers since we're clicking the button)
        exitEditMode(titleInput, squadCard);
    } else {
        // Enter edit mode
        enterEditMode(titleInput, squadCard);
    }
}

function enterEditMode(titleInput, squadCard) {
    // Enable editing
    titleInput.classList.add('editable');
    titleInput.readOnly = false;
    titleInput.focus();
    titleInput.select();
    
    // Change button appearance to indicate validation mode
    const editButton = squadCard.querySelector('.btn[title*="Modifier"], .btn[title*="Options"]');
    if (editButton) {
        editButton.title = 'Valider';
    }
    
    // Flag to prevent blur event when clicking the button
    let isButtonClick = false;
    
    // Store the handlers for later removal
    const handleSave = (e) => {
        if (e.type === 'keydown' && e.key !== 'Enter' && e.key !== 'Escape') {
            return;
        }
        
        if (e.key === 'Escape') {
            // Cancel editing - restore original value
            titleInput.value = squadCard.dataset.squadName;
        }
        
        exitEditMode(titleInput, squadCard, handleSave, handleBlur);
    };
    
    const handleBlur = (e) => {
        // Don't save on blur if it's caused by clicking the button
        if (isButtonClick) {
            isButtonClick = false;
            return;
        }
        
        // Add a small delay to allow button click to be processed first
        setTimeout(() => {
            if (titleInput.classList.contains('editable')) {
                exitEditMode(titleInput, squadCard, handleSave, handleBlur);
            }
        }, 100);
    };
    
    // Add mousedown event to detect button click
    if (editButton) {
        const handleButtonMouseDown = () => {
            isButtonClick = true;
        };
        
        editButton.addEventListener('mousedown', handleButtonMouseDown);
        
        // Store the handler for cleanup
        squadCard._buttonMouseDownHandler = handleButtonMouseDown;
    }
    
    titleInput.addEventListener('blur', handleBlur);
    titleInput.addEventListener('keydown', handleSave);
    
    console.log('✏️ Entered edit mode for squad:', squadCard.dataset.squadName);
}

function exitEditMode(titleInput, squadCard, handleSave, handleBlur) {
    // Disable editing
    titleInput.classList.remove('editable');
    titleInput.readOnly = true;
    titleInput.blur();
    
    // Reset button appearance to normal edit mode
    const editButton = squadCard.querySelector('.btn[title*="Modifier"], .btn[title*="Options"], .btn[title*="Valider"]');
    if (editButton) {
        editButton.title = 'Modifier';
        
        // Remove the mousedown event listener
        if (squadCard._buttonMouseDownHandler) {
            editButton.removeEventListener('mousedown', squadCard._buttonMouseDownHandler);
            delete squadCard._buttonMouseDownHandler;
        }
    }
    
    // Update squad name in dataset
    const newName = titleInput.value.trim();
    if (newName && newName !== squadCard.dataset.squadName) {
        const oldName = squadCard.dataset.squadName;
        squadCard.dataset.squadName = newName;
        
        // Show notification
        showDispatchNotification(
            'Équipe renommée',
            `"${oldName}" → "${newName}"`,
            'blue'
        );
        
        console.log(`Squad renamed: "${oldName}" → "${newName}"`);
    }
    
    // Remove event listeners properly
    if (handleSave) {
        titleInput.removeEventListener('keydown', handleSave);
    }
    if (handleBlur) {
        titleInput.removeEventListener('blur', handleBlur);
    }
    
    console.log('💾 Exited edit mode for squad:', squadCard.dataset.squadName);
}

// Fonction supprimée - remplacée par le système FiveM custom drag and drop
// Les zones de drop sont maintenant gérées dans handleGlobalMouseUp

function handleAgentMouseDown(e) {
    // Vérifier si on clique sur une carte d'agent ou ses enfants
    const agentCard = e.target.closest('.agent-card');
    if (!agentCard) return;
    
    e.preventDefault();
    e.stopPropagation();
    
    const agentId = agentCard.dataset.agentId;
    const agentName = agentCard.dataset.agentName;
    
    if (!agentId) {
        console.error('No agent ID found');
        return;
    }
    
    // Initialiser le drag
    isDragging = true;
    draggedAgent = agentCard;
    
    // Calculer l'offset de la souris par rapport à l'élément
    const rect = agentCard.getBoundingClientRect();
    dragOffset.x = e.clientX - rect.left;
    dragOffset.y = e.clientY - rect.top;
    
    // Créer l'élément fantôme
    createDragGhost(agentCard, e.clientX, e.clientY);
    
    // Ajouter la classe de drag
    agentCard.classList.add('dragging');
    
    // Montrer "Nouvelle équipe" pendant le drag
    const newSquadElement = document.querySelector('.new-squad');
    if (newSquadElement) {
        newSquadElement.classList.add('active');
    }
    
    console.log(`✅ DRAG START: ${agentName} (ID: ${agentId})`);
}

function handleGlobalMouseMove(e) {
    if (!isDragging || !dragGhost) return;
    
    e.preventDefault();
    
    // Mettre à jour la position du fantôme
    dragGhost.style.left = (e.clientX - dragOffset.x) + 'px';
    dragGhost.style.top = (e.clientY - dragOffset.y) + 'px';
    
    // Vérifier sur quel élément on survole
    const elementBelow = document.elementFromPoint(e.clientX, e.clientY);
    const squadCard = elementBelow ? elementBelow.closest('.squads-card') : null;
    const newSquadElement = elementBelow ? elementBelow.closest('.new-squad') : null;
    
    // Supprimer tous les effets de survol
    document.querySelectorAll('.squads-card, .new-squad').forEach(card => {
        card.classList.remove('over');
    });
    
    // Ajouter l'effet de survol à l'élément cible
    if (squadCard) {
        squadCard.classList.add('over');
    } else if (newSquadElement) {
        newSquadElement.classList.add('over');
    }
}

function handleGlobalMouseUp(e) {
    if (!isDragging) return;
    
    e.preventDefault();
    
    // Trouver l'élément sous la souris
    const elementBelow = document.elementFromPoint(e.clientX, e.clientY);
    const squadCard = elementBelow ? elementBelow.closest('.squads-card') : null;
    const newSquadElement = elementBelow ? elementBelow.closest('.new-squad') : null;
    
    const agentId = draggedAgent.dataset.agentId;
    
    // Gérer le drop
    if (squadCard && squadCard !== draggedAgent.closest('.squads-card')) {
        console.log(`🎯 DROP on squad "${squadCard.dataset.squadName}": agent:${agentId}`);
        moveAgentToSquad(agentId, squadCard);
    } else if (newSquadElement) {
        console.log(`🎯 DROP on NEW SQUAD: agent:${agentId}`);
        createNewSquad(agentId);
    }
    
    // Nettoyer après le drag
    endDrag();
}

function createDragGhost(originalElement, x, y) {
    // Créer une copie de l'élément pour le fantôme
    dragGhost = originalElement.cloneNode(true);
    dragGhost.classList.add('drag-ghost');
    dragGhost.style.position = 'fixed';
    dragGhost.style.pointerEvents = 'none';
    dragGhost.style.zIndex = '9999';
    dragGhost.style.opacity = '0.8';
    dragGhost.style.transform = 'rotate(3deg)';
    dragGhost.style.left = (x - dragOffset.x) + 'px';
    dragGhost.style.top = (y - dragOffset.y) + 'px';
    
    document.body.appendChild(dragGhost);
}

function endDrag() {
    if (!isDragging) return;
    
    // Réinitialiser les variables
    isDragging = false;
    
    // Supprimer le fantôme
    if (dragGhost) {
        dragGhost.remove();
        dragGhost = null;
    }
    
    // Nettoyer les classes
    if (draggedAgent) {
        draggedAgent.classList.remove('dragging', 'selected', 'active');
        draggedAgent.blur();
        draggedAgent = null;
    }
    
    // Cacher "Nouvelle équipe" et supprimer les effets de survol
    const newSquadElement = document.querySelector('.new-squad');
    if (newSquadElement) {
        newSquadElement.classList.remove('active', 'over');
    }
    
    // Supprimer tous les effets de survol
    document.querySelectorAll('.squads-card').forEach(card => {
        card.classList.remove('over');
    });
    
    console.log('✅ Drag ended - Element deselected');
}

function createNewSquad(agentId) {
    // Find the agent element
    const agentElement = document.querySelector(`[data-agent-id="${agentId}"]`);
    if (!agentElement) {
        console.error('Agent not found:', agentId);
        return;
    }
    
    // Get agent name
    const agentName = agentElement.dataset.agentName || agentElement.querySelector('span').textContent;
    
    // Generate unique squad name
    const existingSquads = document.querySelectorAll('.squads-card[data-squad-name]');
    let squadCounter = 1;
    let squadName = 'Non définie';
    
    // Check if name already exists and increment if needed
    while (Array.from(existingSquads).some(squad => squad.dataset.squadName === squadName)) {
        squadCounter++;
        squadName = `Non définie ${squadCounter}`;
    }
    
    // Create new squad HTML
    const newSquadHTML = `
        <div class="squads-card default" data-squad-name="${squadName}">
            <div class="title">
                <div class="status gray">N/A</div>
                <input type="text" class="title-edit" value="${squadName}">
                <div class="utils">
                    <div class="btn" title="Options équipe">
                        <img src="build/media/more options.4708a32de5c6696a71f7d841e94c489f.svg" alt="options">
                    </div>
                    <div class="btn radio" title="Radio équipe">
                        <img src="build/media/speaker.d8c776b0d17517e637ba1e2030897690.svg" alt="radio">
                    </div>
                </div>
            </div>
        </div>
    `;
    
    // Find the insertion point: before "En Service" but after other squads, or before "new-squad"
    const newSquadElement = document.querySelector('.new-squad');
    const enServiceSquad = document.querySelector('.squads-card[data-squad-name="En Service"]');
    
    if (!newSquadElement) {
        console.error('New squad element not found');
        return;
    }
    
    // Create temporary container to parse HTML
    const tempDiv = document.createElement('div');
    tempDiv.innerHTML = newSquadHTML;
    const newSquadCard = tempDiv.firstElementChild;
    
    // Insert the new squad:
    // - If "En Service" exists, insert before it (but after other squads)
    // - Otherwise, insert before "new-squad"
    if (enServiceSquad) {
        // Insert before "En Service" (keeping "En Service" at the bottom before "new-squad")
        enServiceSquad.parentNode.insertBefore(newSquadCard, enServiceSquad);
    } else {
        // Fallback: insert before "new-squad"
        newSquadElement.parentNode.insertBefore(newSquadCard, newSquadElement);
    }
    
    // Drag and drop are automatically handled by FiveM system
    
    // Setup edit button for the new squad
    setupSquadEditButton(newSquadCard);
    
    // Move the agent to the new squad
    moveAgentToSquad(agentId, newSquadCard);
    
    // Show notification
    showDispatchNotification(
        'Nouvelle équipe créée',
        `Équipe "${squadName}" créée avec l'agent ${agentName}`,
        'green'
    );
    
    console.log(`New squad "${squadName}" created with agent ${agentName}`);
    
    // Ensure "En Service" is always last (before "new-squad")
    ensureEnServiceLast();
    
    // Setup editing for the new squad
    initializeSquadTitleEditing();
    
    // Clear any residual selections
    clearAllAgentSelections();
}

function ensureEnServiceLast() {
    const squadsList = document.querySelector('.list.squads');
    const enServiceSquad = document.querySelector('.squads-card[data-squad-name="En Service"]');
    const newSquadElement = document.querySelector('.new-squad');
    
    if (!squadsList || !enServiceSquad || !newSquadElement) {
        return;
    }
    
    // Check if "En Service" is already in the correct position (just before "new-squad")
    const correctPosition = newSquadElement.previousElementSibling === enServiceSquad;
    
    if (!correctPosition) {
        // Move "En Service" to just before "new-squad"
        newSquadElement.parentNode.insertBefore(enServiceSquad, newSquadElement);
        console.log('"En Service" moved to last position (before "Nouvelle équipe")');
    }
}

function handleDispatchAction(button) {
    // Ignore clicks on the notification button
    if (button.classList.contains('notif')) {
        console.log('Notification button click ignored');
        return;
    }
    
    const action = button.className.includes('active') ? 'Désactiver' : 'Activer';
    
    if (button.classList.contains('active')) {
        button.classList.remove('active');
        button.style.backgroundColor = 'var(--black2-60)';
    } else {
        button.classList.add('active');
        button.style.backgroundColor = 'var(--green)';
    }
    
    console.log('Dispatch action:', action);
}

function requestBackup(level) {
    // Create a new backup notification
    addBackupNotification(level);
    
    // Also show a temporary notification
    const backupLevels = ['Niveau 1', 'Niveau 2', 'Niveau 3'];
    const colors = ['green', 'orange', 'red'];
    
    showDispatchNotification(
        `Renfort ${backupLevels[level - 1]}`,
        `Demande de renfort ${backupLevels[level - 1]} envoyée et ajoutée aux notifications`,
        colors[level - 1],
        false
    );
    
    console.log('Backup requested:', level);
}

function addBackupNotification(level) {
    const colors = ['green', 'orange', 'red'];
    const colorClass = `color-${colors[level - 1]}`;
    const notificationId = generateNotificationId();
    const currentTime = getCurrentTime();
    
    // Create the HTML for the new backup notification
    const newNotificationHTML = `
        <div class="call-card ${colorClass}">
            <div class="header">
                <div class="title">
                    <div class="case-list">
                        <div class="case">
                            <img src="build/media/weapon.e03e71244124a1f55fda7561e7cd80f6.svg" alt="weapon">
                        </div>
                        <div class="case case-id">
                            ${notificationId}
                        </div>
                    </div>
                    <span>Backup SASP SUD niveau ${level}</span>
                </div>
                <div class="timing">${currentTime}</div>
            </div>
            <div class="description">
                Besoin d'aide dans la <b>Rue Paleto Boulvard</b> par l'agent <b>59</b>
            </div>
            <div class="call-squads">
            </div>
        </div>
    `;
    
    // Find the notifications list container
    const notificationsList = document.querySelector('.dispatch-container .list:not(.squads):not(.wanted)');
    
    if (notificationsList) {
        // Create a temporary div to parse the HTML
        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = newNotificationHTML;
        const newNotification = tempDiv.firstElementChild;
        
        // Add the new notification at the top of the list
        notificationsList.insertBefore(newNotification, notificationsList.firstChild);
        
        // Wait a moment for DOM to settle, then initialize events
        setTimeout(() => {
            setupCallCardEvents(newNotification);
        }, 50);
        
        console.log(`Backup notification niveau ${level} added with ID ${notificationId}`);
    }
}

function generateNotificationId() {
    // Generate a random 3-digit ID
    return Math.floor(100 + Math.random() * 900);
}

function getCurrentTime() {
    const now = new Date();
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    return `${hours}:${minutes}`;
}

function initializeBackupButtons() {
    // Essayer plusieurs sélecteurs pour trouver les boutons
    const selectors = [
        '.dispatch-header .backup .action-button',
        '.backup .action-button',
        '.dispatch-container .backup .action-button'
    ];
    
    let backupButtons = [];
    
    for (const selector of selectors) {
        backupButtons = document.querySelectorAll(selector);
        if (backupButtons.length > 0) break;
    }
    
    if (backupButtons.length > 0) {
        backupButtons.forEach((button, level) => {
            // Forcer les styles pour être sûr que le bouton est cliquable
            button.style.pointerEvents = 'auto !important';
            button.style.cursor = 'pointer';
            button.style.zIndex = '1000';
            button.style.position = 'relative';
            
            // Supprimer les anciens event listeners s'ils existent
            button.removeEventListener('click', button._backupClickHandler);
            
            // Créer un nouveau handler et le stocker
            button._backupClickHandler = function(e) {
                e.preventDefault();
                e.stopPropagation();
                requestBackup(level + 1);
            };
            
            button.addEventListener('click', button._backupClickHandler);
        });
    } else {
        // Dernière tentative - chercher par classes individuelles
        const backup1 = document.querySelector('.action-button.one');
        const backup2 = document.querySelector('.action-button.two');
        const backup3 = document.querySelector('.action-button.three');
        
        [backup1, backup2, backup3].forEach((button, index) => {
            if (button) {
                button.style.pointerEvents = 'auto !important';
                button.style.cursor = 'pointer';
                
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    requestBackup(index + 1);
                });
            }
        });
    }
}

function changeSquadStatus(statusItem) {
    // Remove active from all status items
    document.querySelectorAll('.status-item').forEach(item => {
        item.classList.remove('active');
    });
    
    // Set active status
    statusItem.classList.add('active');
    
    const status = statusItem.textContent;
    console.log('Squad status changed to:', status);
}

function editWantedPerson(card) {
    const titleDiv = card.querySelector('.title');
    const reasonDiv = card.querySelector('.reason');
    const descriptionDiv = card.querySelector('.description');
    
    if (!titleDiv || !reasonDiv || !descriptionDiv) {
        console.error('Éléments requis non trouvés dans la carte');
        return;
    }
    
    // Check if already in edit mode
    const isEditing = titleDiv.contentEditable === 'true';
    
    if (!isEditing) {
        // Enter edit mode - simple without colors
        titleDiv.contentEditable = true;
        reasonDiv.contentEditable = true;
        descriptionDiv.contentEditable = true;
        
        // Focus on title
        titleDiv.focus();
        
        // Save on Enter or click outside
        const saveChanges = () => {
            titleDiv.contentEditable = false;
            reasonDiv.contentEditable = false;
            descriptionDiv.contentEditable = false;
            
            console.log('Wanted person edited successfully');
        };
        
        // Save when clicking outside or pressing Enter
        const handleKeydown = (e) => {
            if (e.key === 'Enter') {
                e.preventDefault();
                saveChanges();
            }
        };
        
        const handleBlur = () => {
            setTimeout(saveChanges, 100);
        };
        
        titleDiv.addEventListener('keydown', handleKeydown);
        reasonDiv.addEventListener('keydown', handleKeydown);
        descriptionDiv.addEventListener('keydown', handleKeydown);
        
        titleDiv.addEventListener('blur', handleBlur);
        reasonDiv.addEventListener('blur', handleBlur);
        descriptionDiv.addEventListener('blur', handleBlur);
    }
}

function makeElementEditable(element) {
    // Skip if already editable
    if (element.contentEditable === 'true') {
        return;
    }
    
    // Make this specific element editable
    element.contentEditable = true;
    element.focus();
    
    // Save changes when done
    const saveChanges = () => {
        element.contentEditable = false;
        console.log('Element edited:', element.textContent);
    };
    
    // Save on Enter or click outside
    const handleKeydown = (e) => {
        if (e.key === 'Enter') {
            e.preventDefault();
            saveChanges();
        }
    };
    
    const handleBlur = () => {
        setTimeout(saveChanges, 100);
    };
    
    element.addEventListener('keydown', handleKeydown, { once: true });
    element.addEventListener('blur', handleBlur, { once: true });
}

function deleteWantedPerson(card) {
    if (confirm('Êtes-vous sûr de vouloir supprimer cette personne recherchée ?')) {
        card.style.animation = 'fadeOut 0.3s ease';
        setTimeout(() => {
            card.remove();
        }, 300);
        
        console.log('Wanted person deleted');
    }
}

function filterWantedList(searchTerm) {
    const wantedCards = document.querySelectorAll('.wanted-card');
    const searchLower = searchTerm.toLowerCase().trim();
    
    let visibleCards = 0;
    
    wantedCards.forEach(card => {
        // Get all text content from the card
        const title = card.querySelector('.title')?.textContent.toLowerCase() || '';
        const reason = card.querySelector('.reason')?.textContent.toLowerCase() || '';
        const description = card.querySelector('.description')?.textContent.toLowerCase() || '';
        
        // Check if search term matches any field
        const matches = searchLower === '' ||
                       title.includes(searchLower) ||
                       reason.includes(searchLower) ||
                       description.includes(searchLower);
        
        if (matches) {
            card.style.display = 'flex';
            card.style.visibility = 'visible';
            card.style.opacity = '1';
            visibleCards++;
        } else {
            card.style.display = 'none';
            card.style.visibility = 'hidden';
            card.style.opacity = '0';
        }
    });
    
    // Handle empty categories visibility
    const categories = document.querySelectorAll('.wanted-category, .wanted-category-civil, .wanted-category-vehicule');
    categories.forEach(category => {
        const categoryCards = category.querySelectorAll('.wanted-card');
        const visibleCategoryCards = Array.from(categoryCards).filter(card => 
            card.style.display !== 'none'
        );
        
        // Hide category if no visible cards, show if has visible cards
        if (visibleCategoryCards.length === 0 && searchTerm.trim() !== '') {
            category.style.opacity = '0.5';
        } else {
            category.style.opacity = '1';
        }
    });
    
    // Show "no results" message if needed
    showSearchResults(visibleCards, searchTerm);
}

function showSearchResults(count, searchTerm) {
    // Remove existing no-results message
    const existingMessage = document.querySelector('.no-results-message');
    if (existingMessage) {
        existingMessage.remove();
    }
    
    if (count === 0 && searchTerm.trim() !== '') {
        // Create and show no results message
        const wantedSection = document.querySelector('.list.wanted');
        const noResultsDiv = document.createElement('div');
        noResultsDiv.className = 'no-results-message';
        noResultsDiv.style.cssText = `
            padding: 20px;
            text-align: center;
            color: #888;
            font-style: italic;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 6px;
            margin: 10px 0;
        `;
        noResultsDiv.innerHTML = `
            <div>Aucun résultat trouvé pour "${searchTerm}"</div>
            <div style="font-size: 0.9em; margin-top: 5px;">Essayez avec un autre terme de recherche</div>
        `;
        
        wantedSection.appendChild(noResultsDiv);
    }
}

function showDispatchNotification(title, message, color = 'blue', isHTML = false) {
    const notificationsContainer = document.querySelector('.dispatch-notifications');
    if (!notificationsContainer) return;
    
    const notification = document.createElement('div');
    notification.className = `call-card enter color-${color}`;
    
    const descriptionContent = isHTML ? message : `<b>Notification</b> - ${message}`;
    
    notification.innerHTML = `
        <div class="header">
            <div class="title">${title}</div>
            <div class="timing">${new Date().toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' })}</div>
        </div>
        <div class="description">
            ${descriptionContent}
        </div>
    `;
    
    notificationsContainer.appendChild(notification);
    
    // Remove notification after 5 seconds
    setTimeout(() => {
        notification.classList.add('exit-active');
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 5000);
}

function updateCallDetails(card) {
    const title = card.querySelector('.title span')?.textContent || 'Appel inconnu';
    const description = card.querySelector('.description')?.textContent || 'Aucune description';
    const time = card.querySelector('.timing')?.textContent || '';
    
    console.log('Call details updated:', { title, description, time });
}

function initializeDispatchUpdates() {
    // Simulate real-time updates
    setInterval(() => {
        updateDispatchTimes();
        simulateNewCalls();
    }, 30000); // Update every 30 seconds
}

function updateDispatchTimes() {
    const timeElements = document.querySelectorAll('.timing');
    timeElements.forEach(element => {
        // Update timing display (this would typically come from server)
        const currentTime = new Date();
        const minutes = Math.floor(Math.random() * 60);
        const timeAgo = new Date(currentTime.getTime() - minutes * 60000);
        element.textContent = timeAgo.toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' });
    });
}

function simulateNewCalls() {
    // Simulate occasional new calls
    if (Math.random() < 0.3) { // 30% chance
        const callTypes = [
            { 
                title: 'Trouble à l\'ordre public', 
                color: 'orange', 
                icon: 'build/media/player.0ba8bc6495d555073e78453185f97899.svg',
                location: 'Centre-ville',
                details: 'Bagarre signalée'
            },
            { 
                title: 'Accident mineur', 
                color: 'yellow', 
                icon: 'build/media/cars.bf3d62e59e736d81d2062ef161be940b.svg',
                location: 'Autoroute A1',
                details: 'Accrochage sans blessé'
            },
            { 
                title: 'Contrôle de routine', 
                color: 'blue', 
                icon: 'build/media/cars.bf3d62e59e736d81d2062ef161be940b.svg',
                location: 'Zone industrielle',
                details: 'Contrôle préventif'
            }
        ];
        
        const randomCall = callTypes[Math.floor(Math.random() * callTypes.length)];
        
        // Create more detailed notification with assets
        const detailedMessage = `
            <div style="display: flex; align-items: center; margin-bottom: 4px;">
                <img src="build/media/pointer.e23c225feeb4381a6a94b3da7415b030.svg" alt="location" style="width: 12px; height: 12px; margin-right: 6px; opacity: 0.8;">
                ${randomCall.location}
            </div>
            <div style="display: flex; align-items: center;">
                <img src="${randomCall.icon}" alt="type" style="width: 12px; height: 12px; margin-right: 6px; opacity: 0.8;">
                ${randomCall.details}
            </div>
        `;
        
        showDispatchNotification(
            'Nouvel appel',
            detailedMessage,
            randomCall.color,
            true // Indicates HTML content
        );
    }
}

function showBodyPartDetails(part) {
    const partName = part.dataset.part;
    const healthValue = part.querySelector('span').textContent;
    
    console.log(`Body part: ${partName} - ${healthValue}`);
    
    // Visual feedback
    part.style.backgroundColor = 'var(--global-main-color-40)';
    setTimeout(() => {
        part.style.backgroundColor = '';
    }, 1500);
}

function handleSkeletonClick(e) {
    // Calculate click position relative to skeleton
    const rect = e.target.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    
    console.log(`Skeleton clicked at: ${x}, ${y}`);
}

// HUD System
function updateHUD() {
    const hudBars = document.querySelectorAll('.hudBar');
    
    hudBars.forEach(bar => {
        const barType = bar.classList[1]; // health, armor, etc.
        animateHudBar(bar, barType);
    });
}

function animateHudBar(bar, type) {
    // Example: simulate changing values
    const randomValue = Math.random() * 100;
    bar.style.width = randomValue + '%';
    
    // Add pulsing effect for low values
    if (randomValue < 25) {
        bar.classList.add('pulsing');
    } else {
        bar.classList.remove('pulsing');
    }
}

// Utility Functions
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    notification.textContent = message;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.remove();
    }, 3000);
}

function playSound(soundFile) {
    // Play sound from build/assets/sounds/ if available
    const audio = new Audio(`build/assets/sounds/${soundFile}`);
    audio.volume = 0.5;
    audio.play().catch(e => console.log('Sound not available:', e));
}

// Asset Preloader
function preloadAssets() {
    const imagesToPreload = [
        'build/media/weapon.e03e71244124a1f55fda7561e7cd80f6.svg',
        'build/media/check.02fc1e98ef41af44a20bde768d4a10f1.svg',
        'build/media/cross.941e01b75254f98d9a2e2950c3cb3bcf.svg',
        'build/assets/inventory/items/weapon_pistol.png',
        'build/assets/inventory/items/water.png',
        'build/assets/inventory/items/bread.png',
        'build/assets/vehicleshop/adder.png',
        'build/assets/vehicleshop/zentorno.png'
    ];
    
    imagesToPreload.forEach(src => {
        const img = new Image();
        img.src = src;
    });
}

// Initialize asset preloading
preloadAssets();

// Export functions for global access
window.UIManager = {
    showNotification,
    playSound,
    updateHUD,
    selectInventoryItem,
    selectVehicle,
    selectFace
};

// Force display of wanted cards only when Recherchés tab is active
function forceShowWantedCards() {
    const activeTab = document.querySelector('.dispatch-container .menu .tab.selected');
    if (activeTab && activeTab.textContent.trim() === 'Recherchés') {
        const wantedSection = document.querySelector('.dispatch-container .list.wanted');
        if (wantedSection) {
            wantedSection.style.display = 'flex';
            wantedSection.style.visibility = 'visible';
            wantedSection.style.opacity = '1';
            
            // Force show all wanted categories (civil and vehicule)
            const wantedCategories = document.querySelectorAll('.wanted-category, .wanted-category-civil, .wanted-category-vehicule');
            wantedCategories.forEach(category => {
                category.style.display = 'block';
                category.style.visibility = 'visible';
                category.style.opacity = '1';
                
                // Force show category lists
                const categoryList = category.querySelector('.list');
                if (categoryList) {
                    categoryList.classList.add('expand');
                    categoryList.style.display = 'flex';
                    categoryList.style.visibility = 'visible';
                    categoryList.style.opacity = '1';
                }
            });
            
            console.log('Forced display of wanted section with all categories');
        }
    }
}

window.addEventListener('message', function(event) {
    const data = event.data;
    if (data.type === 'newCall' && data.call) {
        const call = data.call;
        const date = new Date(call.timestamp * 1000);
        const time = date.toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' });
        let color = 'green';
        if (call.priority && call.priority.toLowerCase().includes('3')) color = 'red';
        else if (call.priority && call.priority.toLowerCase().includes('2')) color = 'orange';
        const notifHTML = `
            <div class="call-card color-${color}">
                <div class="header">
                    <div class="title">
                        <div class="case-list">
                            <div class="case">
                                <img src="build/media/weapon.e03e71244124a1f55fda7561e7cd80f6.svg" alt="weapon">
                            </div>
                            <div class="case case-id">${call.id}</div>
                        </div>
                        <span>${call.title}</span>
                    </div>
                    <div class="timing">${time}</div>
                </div>
                <div class="description">${call.description}</div>
                <div class="call-squads">
                    ${call.takenBy ? `<span>Pris par: <b>${call.takenBy}</b></span>` : ''}
                </div>
            </div>
        `;
        const notifContainer = document.querySelector('.dispatch-notifications');
        if (notifContainer) {
            notifContainer.insertAdjacentHTML('afterbegin', notifHTML);
            setTimeout(() => {
                const notif = notifContainer.querySelector('.call-card');
                if (notif) notif.remove();
            }, 5000);
        }
    }
    // Ajout pour backupRequested
    if (data.type === 'backupRequested' && data.level && data.location && data.requester) {
        const backupLevels = ['Niveau 1', 'Niveau 2', 'Niveau 3'];
        const colors = ['green', 'orange', 'red'];
        const notifHTML = `
            <div class="call-card color-${colors[data.level - 1]}">
                <div class="header">
                    <div class="title">
                        <div class="case-list">
                            <div class="case">
                                <img src="build/media/weapon.e03e71244124a1f55fda7561e7cd80f6.svg" alt="weapon">
                            </div>
                            <div class="case case-id">BACKUP</div>
                        </div>
                        <span>Backup SASP SUD ${backupLevels[data.level - 1]}</span>
                    </div>
                    <div class="timing">${new Date().toLocaleTimeString('fr-FR', { hour: '2-digit', minute: '2-digit' })}</div>
                </div>
                <div class="description">
                    Besoin d'aide à <b>${data.location}</b> par l'agent <b>${data.requester}</b>
                </div>
                <div class="call-squads"></div>
            </div>
        `;
        const notifContainer = document.querySelector('.dispatch-notifications');
        if (notifContainer) {
            notifContainer.insertAdjacentHTML('afterbegin', notifHTML);
            setTimeout(() => {
                const notif = notifContainer.querySelector('.call-card');
                if (notif) notif.remove();
            }, 5000);
        }
    }
    // Ajout pour requestBackup (commande /backup)
    if (data.type === 'requestBackup' && data.level) {
        requestBackup(data.level);
    }
});
