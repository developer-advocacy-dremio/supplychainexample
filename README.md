# Mark's Supply Chain Demo: End-to-End Dremio Example

This repository contains a self-contained SQL script (`supply_chain_end_to_end_demo.sql`) that builds a complete, data-driven supply chain environment within Dremio. It simulates a realistic scenario for a mid-sized retailer managing orders, inventory, suppliers, and logistics across multiple regions.

## The Narrative

**Scenario**: "RetailCo" is facing pressure to optimize its supply chain. Executives need answers to critical questions about inventory health, supplier reliability, and shipping costs. The data lives in disparate "systems" (simulated here as raw tables), and the goal is to unify this data to empower both BI dashboards and AI-driven ad-hoc analysis.

The demo showcases how Dremio transforms raw, disconnected data into a high-performance semantic layer that business users and AI agents can query naturally.

## Architecture Guidelines (Medallion Pattern)

This project follows the **Medallion Architecture** (Bronze $\to$ Silver $\to$ Gold) to organize data quality and business logic.

### 🥉 Bronze Layer: Raw Data
**What works here**: Pure ingestion.
*   **Content**: Raw tables like `Orders`, `Products`, `Suppliers`, `Inventory_Snapshot`.
*   **Why**: We capture data exactly as it comes from source systems (ERPs, WMS, Logistics providers). No transformations are applied here to ensuring an immutable audit trail.
*   **Grain**: Transactional (one row per order line, one row per PO, etc.).

### 🥈 Silver Layer: Enrichment & Standardization
**What works here**: Cleaning, Joining, and Logic application.
*   **Actions**:
    *   **Denormalization**: Joining `Orders` with `Products`, `Warehouses`, and `Shipments` to create wide, analytical views.
    *   **Calculated Fields**: Logic like `days_to_ship` or `is_late_shipment` is defined once here, ensuring consistency across the organization.
    *   **Standardization**: Casting data types and handling nulls.
*   **Why**: This layer abstracts complexity. Analysts shouldn't have to know how to join 5 tables to answer "How many orders were late?". They just query `Silver.Enriched_Orders`.

### 🥇 Gold Layer: Strategic Business Metrics
**What works here**: Aggregation and KPIs.
*   **Content**: Highly aggregated views tailored for executives and dashboards.
    *   `Fulfillment_Metrics`: Regional shipping performance and revenue.
    *   `Inventory_Risk`: Capital tied up in "stockout" or "low stock" products.
    *   `Supplier_Scorecard`: Grading suppliers on lead time and fill rates.
*   **Why**: These views are optimized for speed and consumption. They answer the "So What?" questions immediately.

## Why This Setup Matches Dremio & AI

1.  **Semantic Layer as "Context"**: Dremio's semantic layer (Silver/Gold) acts as the "context window" for the AI Agent. By defining business logic (like what defines a "Late Shipment") in SQL views, the AI doesn't have to guess or hallucinate the logic—it simply queries the view.
2.  **Federated Reality**: The demo simulates data coming from different domains (Sales vs. Logistics). Dremio unifies this without physical movement (ETL), demonstrating **Logical Data Federation**.
3.  **Governance**: The separation of layers allows for role-based access control. Data Engineers manage Bronze, Analytics Engineers refine Silver, and Business Users consume Gold.
4.  **Performance**: High-level aggregations in Gold can be accelerated using Dremio Reflections, providing sub-second response times for dashboards and AI queries even as data scale grows.

## How to Run This Demo

1.  **Open Dremio**: Navigate to your Dremio SQL Runner.
2.  **Load the Script**: Copy the contents of `supply_chain_end_to_end_demo.sql`.
3.  **Execute**: Run the script. It will:
    *   Create the `SupplyChainDB` folder structure.
    *   Seed >100 rows of data per table (Orders, Inventory, etc.).
    *   Build the View layers (Bronze/Silver/Gold).
4.  **Test with AI**: Copy the prompts found at the bottom of the script into Dremio's chat interface to see the semantic layer in action.
