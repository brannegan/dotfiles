#!/usr/bin/nu

let icons =  [
               {class: Alacritty,       icon:  },
               {class: firefox,         icon:  },
               {class: KeePassXC,       icon:  },
               {class: telegramdesktop, icon:  },
               {class: mpv,             icon: 懶},
               {class: None,            icon:  },
               {class: _,               icon:  },
             ]
let titles = [
               {title: NVIM, icon:  },
             ]
let map_icon  = {|r| $icons  | where ($it.class == $r.class) || ($it.class == _) | get icon.0 }

let map_title = {|r| let title = ($titles | where $it.title == ($r.title | split row ' ' 
                                                                         | last 1 
                                                                         | get 0)) 
                     if ($title | empty?) {
                       $r.icon
                     } else {
                       $title | get icon.0 
                }}
                
let tmp_windows = '/tmp/hypr_windows.json' 
if ($tmp_windows | path exists) {
  rm $tmp_windows
}
socat -u $"UNIX-CONNECT:/tmp/hypr/($env.HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock" - | each {
  let activeworkspace = (hyprctl monitors -j | from json | get 0.ActiveWorkspace.id)
  let activewindow = (hyprctl activewindow -j | from json)
  let activewindow = if ($activewindow | empty?) { 
                        { address: 0x0, workspace_id: $activeworkspace, class: None, title: None }
                     } else {
                         ($activewindow | select address workspace.id class title)
                     }
  let windows = if ($tmp_windows | path exists) {
                   (open $tmp_windows | from json 
                                      | where workspace_id != $activewindow.workspace_id
                                      | select address workspace_id class title 
                                      | append [$activewindow])
                } else {
                   ([$activewindow])
                }
  let max_id = ($windows | where class != None 
                         | select workspace_id 
                         | math max 
                         | get workspace_id 
                         | into int)
  let windows = (1..$max_id | each { |id| 
                                  let window = ($windows | where workspace_id == $id)
                                  if ($window | empty?) {
                                    { address: 0x0,  workspace_id: $id,  class: None, title: None}           
                                  } else {
                                    $window.0 
                                  }
                                })
  $windows | to json --raw | save $tmp_windows
  let windows = ($windows | insert icon $map_icon 
                          | update icon $map_title 
                          | insert active {|r| $r.workspace_id == $activeworkspace})
  print ($windows | to json --raw)
}
