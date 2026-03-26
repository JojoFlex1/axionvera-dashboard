# Axionvera Dashboard

Web dashboard for interacting with **Axionvera Network** smart contracts on Stellar. Built with Next.js and powered by Soroban.

## 🚀 Quick Start

Get the project up and running in under 3 minutes:

1. **Clone & Enter Repo**
   ```bash
   git clone https://github.com/JerryIdoko/axionvera-dashboard.git && cd axionvera-dashboard
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Start Development**
   ```bash
   npm run dev
   ```
   Visit [http://localhost:3000](http://localhost:3000) to see it live.

---

## 🛠 Prerequisites

Ensure your environment meets these mandatory specifications before setup:

| Tool | Version Requirement | Purpose |
| :--- | :--- | :--- |
| **Node.js** | `v18.0.0` or higher | Core Runtime |
| **npm** | `v9.0.0`+ (or Yarn `v1.22`+) | Package Management |
| **Freighter** | Latest browser extension | Wallet Interaction |

---

## 🏗 Features

- **Wallet Connection**: Seamless Freighter integration
- **Vault Management**: Deposit and withdraw from the Axionvera vault
- **Rewards**: Track and claim rewards in real-time
- **Transaction History**: Comprehensive ledger of all user operations

## ⚙️ Configuration

Copy the example environment file and fill in your contract IDs:

```bash
cp .env.example .env.local
```

| Variable | Description | Default |
| :--- | :--- | :--- |
| `NEXT_PUBLIC_STELLAR_NETWORK` | Target network | `testnet` |
| `NEXT_PUBLIC_SOROBAN_RPC_URL` | Soroban RPC endpoint | https://soroban-testnet.stellar.org |
| `NEXT_PUBLIC_AXIONVERA_VAULT_CONTRACT_ID` | Vault contract address | - |

---

## 🩺 Troubleshooting

Common issues and their resolutions:

| Issue | Potential Cause | Solution |
| :--- | :--- | :--- |
| `node_modules` conflicts | Stale or corrupted packages | Run `rm -rf node_modules package-lock.json && npm install` |
| `.env` variables missing | File not named `.env.local` | Rename `.env` or `.env.example` to `.env.local`. Ensure no trailing spaces in values. |
| `Freighter not found` | Extension locked or missing | Ensure Freighter is installed, unlocked, and refreshed if just installed. |
| ESLint/Type errors | Breaking changes in `src/` | Run `npm run lint` and `npm run typecheck` to debug specific violations. |

---

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## Infrastructure as Code (Terraform)

This project includes Terraform configurations for provisioning AWS infrastructure. See [terraform/README.md](terraform/README.md) for detailed instructions.

### Quick Terraform Commands

```bash
# Navigate to terraform directory
cd terraform

# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply

# Destroy resources when done
terraform destroy
```

### Prerequisites for Terraform

- Terraform 1.0+
- AWS CLI configured with credentials
- SSH key pair in AWS EC2 console

## 📜 License

MIT — see [LICENSE](LICENSE).
