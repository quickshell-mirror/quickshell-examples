pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

// WARNING don't forget to track nodes with PwNodeObjectTracler
Singleton {
  id: root

  function getIcon(node: PwNode): string {
    return (node.isSink) ? getSinkIcon(node) : getSourceIcon(node);
  }

  function getSinkIcon(node: PwNode): string {
    return (node.audio.muted) ? "󰝟" : (node.audio.volume > 0.5) ? "󰕾" : (node.audio.volume > 0.01) ? "󰖀" : "󰕿";
  }

  function getSourceIcon(node: PwNode): string {
    return (node.audio.muted) ? "󰍭" : "󰍬";
  }

  function toggleMute(node: PwNode) {
    node.audio.muted = !node.audio.muted;
  }

  function wheelAction(event: WheelEvent, node: PwNode) {
    if (event.angleDelta.y < 0) {
      node.audio.volume -= 0.01;
    } else {
      node.audio.volume += 0.01;
    }

    if (node.audio.volume > 1.3) {
      node.audio.volume = 1.3;
    }
    if (node.audio.volume < 0) {
      node.audio.volume = 0.0;
    }
  }
}
