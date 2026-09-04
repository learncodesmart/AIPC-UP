<p align="right">
  <a href="./README.md">中文</a> · <strong>English</strong>
</p>

<p align="center">
  <img src="./assets/logo-512.png" alt="AIPC UP Logo" width="112">
</p>

<h1 align="center">Turn Every PC into an AI PC</h1>

<p align="center">
  <strong>One Desktop. Your AI Agents, Actually Collaborating.</strong>
</p>

<p align="center">
  A <strong>Local-First AI Agent Desktop Workspace</strong> for Windows.<br>
  Multi-Agent Teams · Native Remote Desktop & Screen Wall · Full Automation · Full-Disk File Management · 24/7 Remote Dispatch
</p>

<p align="center">
  <a href="https://github.com/learncodesmart/AIPC-UP/releases/latest">
    <img alt="Download" src="https://img.shields.io/badge/Download-Windows%20Installer-111827?style=for-the-badge&logo=github&logoColor=white">
  </a>
  <a href="https://huiai.io/product/">
    <img alt="Product" src="https://img.shields.io/badge/Product-huiai.io-0EA5E9?style=for-the-badge&logo=googlechrome&logoColor=white">
  </a>
  <a href="https://huiai.io/aipc-up/docs/en/">
    <img alt="Docs" src="https://img.shields.io/badge/Docs-Documentation-7C3AED?style=for-the-badge&logo=readthedocs&logoColor=white">
  </a>
  <img alt="Platform" src="https://img.shields.io/badge/Platform-Windows-2563EB?style=for-the-badge&logo=windows11&logoColor=white">
  <a href="https://github.com/learncodesmart/AIPC-UP/releases">
    <img alt="Version" src="https://img.shields.io/badge/Version-v1.0.1-10B981?style=for-the-badge">
  </a>
</p>

<p align="center">
  <a href="https://github.com/learncodesmart/AIPC-UP/releases/latest"><strong>📥 Download Windows Installer</strong></a>
  ·
  <a href="https://huiai.io/product/">🌐 Official Website</a>
  ·
  <a href="https://huiai.io/aipc-up/docs/en/">📖 Documentation</a>
</p>

<p align="center">
  <img alt="Claude" src="https://img.shields.io/badge/Claude%20Code-AI%20Core-1F2937?style=flat-square">
  <img alt="Codex" src="https://img.shields.io/badge/Codex-AI%20Core-111827?style=flat-square">
  <img alt="OpenCode" src="https://img.shields.io/badge/OpenCode-AI%20Core-0F172A?style=flat-square">
  <img alt="Gemini CLI" src="https://img.shields.io/badge/Gemini%20CLI-AI%20Core-2563EB?style=flat-square">
  <img alt="Ollama" src="https://img.shields.io/badge/Ollama-Offline%20Local-FF6F00?style=flat-square">
  <img alt="MCP" src="https://img.shields.io/badge/MCP-Extensible-7C3AED?style=flat-square">
  <img alt="Local First" src="https://img.shields.io/badge/Local--First-Privacy-059669?style=flat-square">
</p>

---

## ✨ What is AIPC UP?

**AIPC UP** is not just another chatbot window. It is a **local-first AI Agent desktop workspace** deeply integrated into Windows.

It enables AI Agents to truly "live" on your PC—not just understanding natural speech and text, but operating software, coordinating multi-agent teams, and delivering end-to-end complex tasks within your authorized boundaries. All codebases and environments **remain 100% on your local PC**.

---

## 🌟 6 Key Differentiators

<table>
  <tr>
    <td width="50%">
      <h3>📱 Native Remote Control & Screen Wall</h3>
      Real-time visual monitoring dashboard. Scan a QR code from mobile to connect instantly, featuring an ergonomic <b>Virtual Trackpad Joystick</b> (trackpad, left-click drag, right-click menu) and <b>360° Infinite Scroll Wheel</b>, multi-monitor switching, and instant exit—zero third-party remote apps needed.
    </td>
    <td width="50%">
      <h3>🗂️ Standalone Full-Disk File Manager</h3>
      Double-click to "drill into" folders just like Windows File Explorer. Blazing-fast full-disk search, drag-and-drop upload, batch ZIP packaging, zero-memory streaming downloads, Git diff review, and live media preview.
    </td>
  </tr>
  <tr>
    <td>
      <h3>🎙️ Real-Time Voice & Mini Floating Window</h3>
      Press <kbd>Ctrl+M</kbd> for fluid voice dictation with intelligent punctuation; press <kbd>Alt+Q</kbd> to summon the ultra-compact 48px always-on-top window for instant queries without blocking your workspace.
    </td>
    <td>
      <h3>🖱️ Desktop & Browser Full Automation</h3>
      Native mouse/keyboard simulation for desktop software; integrated <b>Browser Harness</b> engine driven by Chrome DevTools Protocol (CDP) for DOM tree perception, element scraping, and cross-website form filling.
    </td>
  </tr>
  <tr>
    <td>
      <h3>👥 Multi-Agent Team Collaboration</h3>
      Move beyond single prompts. Assemble architects, developers, researchers, and testers. Agents autonomously break down goals, cross-examine solutions, and collaborate in the same workspace.
    </td>
    <td>
      <h3>⏰ 24/7 Scheduled Tasks & Remote Channels</h3>
      Standard Cron scheduling to wake up your PC in background for daily reports and health checks; direct integration with <b>WeChat, Work WeChat, Feishu/Lark, DingTalk, and Telegram</b>.
    </td>
  </tr>
</table>

---

## ⚡ 3-Step Quick Start

### 1. Download & Launch
Download `AIPC.UP.Setup.<version>.exe` from [GitHub Releases](https://github.com/learncodesmart/AIPC-UP/releases/latest). Install and launch in seconds, then set up your local encrypted master account.

### 2. Configure Models (Choose from 3 Routes)
Open **Settings** and pick the route that fits your environment:

| Route | Best For | How to Configure |
| :--- | :--- | :--- |
| **Route A: HuiAI Official (Recommended)** | Zero-friction setup | Paste your [HuiAI Access Token](https://huiai.io/token/) in "Settings → HuiAI Config" to sync official channels and premium tools |
| **Route B: Custom API Key** | Custom relays / Provider APIs | Configure Base URL and API Key for DeepSeek, Kimi, SiliconFlow, OpenAI, etc. under "Settings → Models" |
| **Route C: Local Offline Ollama** | Local GPU, 100% private | Connect directly to your local Ollama instance with zero external network required |

### 3. Run Your First Task
Select a test folder in the workspace panel, pick an assistant (such as **Desktop Automation** or **Aion CLI**), and send:

```text
Inspect this folder in read-only mode and summarize what files it contains in three sentences. Do not modify any files.
```

> 💡 **Tip for New Users**: After configuring models, try pressing <kbd>Ctrl+M</kbd> for voice dictation and <kbd>Alt+Q</kbd> to summon the mini floating window. Then explore mobile remote control and multi-agent teams.

---

## 🛡 Local-First & Safety Guarantees

* 🏠 **Data Sovereignty**: Source files, local documents, and configs stay on your machine—never uploaded silently.
* 🔐 **Granular Authorization**: File modifications, command executions, network requests, and input simulation require explicit approval.
* 👁 **Full Transparency**: Detailed tool calls, code diffs, and execution logs are visible in real time.
* ⏯ **Instant Intervention**: Pause tasks anytime; press <kbd>Shift</kbd> + <kbd>Esc</kbd> to instantly terminate remote control.

---

## 💬 Community & Acknowledgments

#### Support & Community Channels
* 🐧 **QQ Official Technical Group**: `646554497` ([Join QQ Group](https://qm.qq.com/cgi-bin/qm/qr?k=ad41JXjVpuzyRDxy92QTNryWG06axnfR&jump_from=webapi&authKey=184LshAFNLojKGYvHWJnFTFsJJJXjcyukh/tzNmbhZYBXRb16+plyeV8w2QLKm1L))
* ✈️ **Telegram Group**: [@huiai_io](https://t.me/huiai_io)
* 💬 **WeChat Support**: ID `huiai_io` (Mon-Fri 9:30 - 21:00)
* 🐙 **Issues & Feedback**: [GitHub Issues](https://github.com/learncodesmart/AIPC-UP/issues)

#### Open Source Acknowledgments
* [AionUi](https://github.com/iOfficeAI/AionUi) - Modern cross-platform AI desktop workspace and interaction foundation
* [Browser Harness](https://github.com/browser-use/browser-harness) - Modern browser automation engine powered by CDP
* [frp](https://github.com/fatedier/frp) - High-performance reverse proxy for secure tunneling

---

<p align="center">
  <sub>Made with ❤️ by the AIPC UP & 慧AI Team</sub>
</p>
