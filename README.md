# HACKATHON — "INNOVANDO POR UN FUTURO SOSTENIBLE" 
## EcoIncentives Protocol 
**Blockchain-Based Incentive Mechanism for the Circular Economy on LACNet** 
*Final Technical & Economic Report* 

---

### 1. Solution Summary (Abstract) 
EcoIncentives Protocol addresses Peru's structural recycling market failure through an EVM-compatible smart contract deployed on the LACNet blockchain, which automatically mints and allocates EcoPoints to citizen wallets upon verified recycling actions. By encoding the reward mechanism directly into transparent, immutable code, the protocol collapses the transaction and enforcement costs identified in Section 3 to near zero. Simultaneously, the on-chain, auditable record of recycling activity closes the information gap between citizens and municipalities, functioning as a self-executing, Pigouvian-style subsidy that internalizes the positive externality of recycling without requiring costly centralized administration

### 2. Alignment with Hackathon Objectives 
**Hackathon Mandate Context:** The protocol is strategically engineered to directly advance the hackathon's core directive—"Innovando por un Futuro Sostenible"—by leveraging decentralized architecture to foster regional environmental sustainability and public-goods provisioning

**Objective 1 - Market Friction Elimination:** To establish an incentive-compatible economic mechanism that minimizes transaction costs and resolves bidirectional information asymmetry through a decentralized, immutable ledger

**Objective 2 - Open-Source Public-Goods Scalability:** To deliver a non-rival and non-excludable codebase that can be seamlessly forked and adapted by external regional municipalities at a near-zero marginal cost structure (MC → 0), thereby maximizing regional positive externalities
### 3. Project Name 
The project is formally designated **EcoIncentives Protocol**. The name was selected to explicitly communicate the core mechanism-design logic of the solution: the direct, on-chain linkage between a pro-environmental action ("Eco") and a verifiable economic reward ("Incentives"). As a corporate Web3 identity, EcoIncentives Protocol signals to municipalities, investors, and hackathon evaluators that the project is not merely a recycling awareness campaign, but an incentive-compatible economic mechanism implemented as immutable software, consistent with best practices in applied mechanism design and decentralized public-goods provisioning.

### 4. Team Members and Roles 
The team is composed of three members whose roles were divided according to comparative advantage, minimizing internal coordination costs and maximizing joint output — a direct application of the gains-from-specialization principle central to microeconomic theory of the firm. Each member owns a distinct, non-overlapping production function within the project, ensuring accountability and technical depth in every deliverable.

| Team Member | Role | Key Responsibilities |
| :--- | :--- | :--- |
| **Gomez Alfaro, Flavio Victorio** | Lead Blockchain Architect & Smart Contract Developer | Designs, codes, and deploys the Solidity smart contract on the LACNet EVM-compatible network; defines the EcoPoints minting logic, wallet access control, and the gas-optimization strategy described in Section 5. 
| **Falcon Castillo, Mhel Adriana** | Frontend Developer & UI/UX Designer | Builds the citizen-facing web interface, integrates MetaMask wallet connectivity, and designs the end-to-end user experience for waste registration and EcoPoints redemption. 
| **Gonzales Li Calderón, Yussef Emanuel** | Chief Economic Analyst & Project Manager | Develops the microeconomic model underlying the incentive mechanism (Sections 3, 4, 7), coordinates the pitch deck narrative and technical documentation, and manages the project timeline. 

### 5. Problem Description & Market Failure Analysis 
Peru faces a structural crisis in solid-waste management. According to Peru's Ministry of Environment (MINAM), the country generated close to 9 million tonnes of municipal solid waste in 2024 (8,994,762.54 tonnes), of which only 2.7% was effectively recycled through formal channels (MINAM, as cited in RCR Perú, 2026). From a microeconomic standpoint, this outcome is not a failure of individual rationality but a textbook case of market failure driven by negative externalities, consistent with the classical Pigouvian framing of uncompensated social cost (Pigou, 1920): the private cost borne by a household or firm that disposes of waste informally is far lower than the social cost imposed on third parties through landfill overflow, soil and water contamination, and public-health degradation. Because these external costs are not reflected in the private decision-maker's cost function, the market systematically over-produces unmanaged waste and under-produces recycling effort relative to the social optimum.

A second, compounding driver of this inefficiency is the presence of prohibitively high transaction costs, in the Coasean sense (Coase, 1960). Even where formal regulation exists, and even if affected communities and waste generators could in principle bargain toward an efficient allocation, the costs of identifying counterparties, monitoring compliance, and enforcing agreements are too high for a private, decentralized bargaining solution to emerge spontaneously. For the individual citizen, sorting and transporting recyclable material carries a real opportunity cost in time and effort that is rarely compensated, which explains why recycling participation remains suboptimal even among environmentally conscious households. 

Finally, the market suffers from severe information asymmetry on both sides of the exchange. Citizens frequently lack reliable information about the location and operating hours of formal collection centers, while municipalities and recycling operators lack visibility into where and how much recyclable supply is being generated at the household level. This bidirectional information gap is structurally analogous to the classic "market for lemons" problem (Akerlof, 1970): absent a trustworthy, verifiable signal of recycling behavior, no efficient price or reward mechanism can form, and the market for recycling services stagnates well below its socially efficient scale.

**Table 1: Dimensions of Market Failure** 
| Market Dimension | Current Inefficient Status Quo | Economic Impact |
| :--- | :--- | :--- |
| **Externalities** | Unregulated waste disposal in informal landfills. | High social costs, environmental degradation, and public health risks.  |
| **Transaction Costs** | High opportunity cost (time/effort) for citizens to sort and transport waste. | Suboptima recycling rates (only 2.7% effective recycling in Peru).|
| **Information Asymmetry** | Citizens lack clear data on collection centers; municipalities lack data on supply. | Market stagnation and structural inefficiency in the circular economy.|

### 6. Technologies Used & Technical Justification 
The technology stack was selected to minimize both fixed development costs and long-term marginal costs of scale, while maximizing trust and transparency for all stakeholders. Table 2 details each component and its microeconomic or technical justification.

| Technology | Role in the Project | Microeconomic / Technical Justification |
| :--- | :--- | :--- |
| **Solidity & EVM** | Smart Contract Core | Ensures immutability, transparency, and trust, eliminating third-party enforcement costs associated with monitoring compliance. |
| **LACNet Pro-Testnet** | Blockchain Infrastructure | Zero-cost node participation reduces the initial fixed costs and barriers to entry for local governments and municipalities.  |
| **Remix IDE** | Development Environment | Minimizes research-and-development time-to-market by lowering deployment friction during iterative testing.  |
| **MetaMask** | Decentralized Wallet | Standardizes user interaction, reducing switching and adoption costs (barriers to entry) for the end consumer.  |

**Technical Note — Gas Optimization:** The smart contract's core function, `registerRecycling()`, is designed to respect LACNet's per-block gas limit by minimizing on-chain state writes: it uses mapping-based storage for O(1) wallet lookups rather than iterable arrays, restricts EcoPoints minting to a single bounded arithmetic operation per call, and enforces access control through lightweight modifiers rather than redundant on-chain checks. This keeps the gas cost of each transaction small and predictable, preventing any single call — or a burst of concurrent calls — from exhausting the block gas limit and degrading service for other network participants, an on-chain analogue of avoiding a tragedy of the commons over shared block space.
**Note on nomenclature:** In September 2025, LACNet and the LACChain networks it orchestrates were unified under a new joint brand, LNet (IDB Lab & LACNet, 2025). This report retains the name "LACNet" and "LACNet Pro-Testnet" throughout, in line with the hackathon's technical brief and the network's product naming at the infrastructure level.

### 7. Project Links 

**Pitch Deck Link:** [Insert Presentation URL Here] 

**GitHub Repository Link:** [Insert Public Repository URL Here] 

**Video Demo Link (2–5 minutes):** [Insert Video URL Here] 

### 8. Justification of Impact and Scalability 
EcoIncentives Protocol functions as a costly, verifiable signaling mechanism in the sense formalized by signaling theory (Spence, 1973). Because each EcoPoints transaction is recorded immutably on-chain, citizens who accumulate EcoPoints are emitting a credible, hard-to-fake signal of environmentally responsible behavior. This directly resolves the information asymmetry identified in Section 3: municipalities, retailers, or ESG-oriented employers can rely on the on-chain record as a trustworthy proxy for genuine green behavior, opening the door to secondary use cases such as EcoPoints-based discounts, reputation scoring, or preferential access to public services.

The protocol's scalability rests on a distinctive marginal-cost structure. Because LACNet offers zero-cost node participation and the smart contract itself requires no additional physical infrastructure per new user, the marginal cost of onboarding an additional citizen or municipality tends toward zero (MC → 0). This stands in sharp contrast to traditional recycling infrastructure, where scaling requires proportional increases in collection trucks, sorting personnel, and physical facilities, implying a rising marginal cost curve. A near-zero marginal cost structure allows EcoIncentives Protocol to expand from a single-district pilot to a national or multi-country LACNet deployment without a proportional increase in fixed costs.

As adoption grows, the protocol also generates positive network effects: a larger base of on-chain recycling records increases the statistical and policy value of the aggregated dataset for future municipal planning, which in turn increases the incentive for additional municipalities to join. This reinforcing feedback loop is the mirror image of the negative-externality spiral described in Section 3, and constitutes the central economic argument for the protocol's long-run viability and global scalability across other LACNet member economies.

### 9. Future Roadmap & Post-Hackathon Projection
*This roadmap represents the strategic deployment and scaling projection of the EcoIncentives Protocol following the conclusion of the Hackathon in July 2026.* 

#### 📍 Phase 1: Technical Rigor & Security (Q3 2026)
**Objective:** Optimize smart contract efficiency and ensure bulletproof network security. 
**Key Deliverables:** * Conduct comprehensive vulnerability and penetration testing on the Solidity code. 
 Refine gas-optimization strategies to maintain a strictly predictable footprint within LACNet's per-block gas limits. 
**Success Metric:** Zero critical vulnerabilities identified; average transaction gas cost reduced by 15%.
  
####📍 Phase 2: Local Market Validation (Q4 2026) 
**Objective:** Validate the economic incentive model in a controlled, real-world environment. 
**Key Deliverables:**
  * Launch a localized pilot program in a selected district of Lima, Peru. 
  * Establish strategic on-the-ground partnerships with local municipal recycling centers.
  * Deploy the localized citizen-facing UI for alpha testers. 
**Success Metric:** Onboard at least 500 active households and process 2 tons of recyclable material during the first 60 days.
  
#### 📍 Phase 3: Ecosystem Scalability & Commercial Expansion (Q1 2027) 
**Objective:** Drive mass adoption by expanding the economic utility of EcoPoints. 
**Key Deliverables:**

  * Full public launch of the Web3 frontend integrated seamlessly with MetaMask. 
  * Establish commercial agreements with local retail stores and supermarkets to allow citizens to redeem EcoPoints for tangible product discounts. 
  * Open up the aggregated, anonymous on-chain data dashboard for regional municipal planning. 
  
**Success Metric:** Integration with at least 3 major retail chains; expansion of the protocol to 2 additional municipalities within the LACNet ecosystem. [
---

### References 
* Akerlof, G. A. (1970). The market for “lemons”: Quality uncertainty and the market mechanism. [cite_start]The Quarterly Journal of Economics, 84(3), 488–500. https://doi.org/10.2307/1879431 
* Coase, R. H. (1960). The problem of social cost. [cite_start]Journal of Law and Economics, 3, 1–44. https://doi.org/10.1086/466560 
* IDB Lab, & LACNet. (2025, September 29). LACChain and LACNet are now LNet, a global platform for trusted digital innovation. [cite_start]IDB Lab. 
* Pigou, A. C. (1920). The economics of welfare. [cite_start]Macmillan.
* RCR Perú. (2026, May 16). [cite_start]Día mundial del reciclaje: Perú solo recicla el 2.7% de sus residuos pese a que genera casi 9 millones de toneladas, advierte el Minam. 
* Spence, M. (1973). Job market signaling. [cite_start]The Quarterly Journal of Economics, 87(3), 355–374. https://doi.org/10.2307/1882010 
