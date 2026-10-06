# Calendar: first Holedo 1.0 conformance test

Source audit: 2026-10-06 at `0e54eb697dbb8870c28d8f6d6480da993235a8bb` (main). No running deployment was tested. Required target: Admin Standard 1.0 and UI Tokens 1.0; canonical SHA pending. **Result: not conformant / not release-ready against this standard.**

| Requirement | Baseline evidence | Result / next action |
|---|---|---|
| Independent product/database | Phoenix, `Tymeslot.AppSettings`, runtime config | Preserve; no runtime standards dependency |
| Canonical shell | `admin_live/components/layout.ex`: Back to Dashboard, user dropdown, Admin heading, rounded native tabs | Gap: canonical header, layout and controls |
| Seven common sections | `admin_live/tabs.ex`, `formatters.ex`: Authentication, Email, General, Users | Gap: add common settings first, keep native operations below |
| Common atomic save/previews | AdminLive setting toggles/save and email preview/upload | Gap: common transactional form; retain native flows |
| Override precedence | `docs/ADMIN.md`, `Tymeslot.AppSettings` | Existing pattern; extend without altering operational keys |
| Tokens and theme modes | Native layout, `assets/css/app.css`, theme customization | Not visually tested; map shell tokens without replacing booking themes |
| Icon/SEO/OG/homepage/access/legal | No Holedo common schema/form identified in inspected admin | Gap: canonical fields, initial HTML metadata and consent behavior |
| Injection recovery | No canonical header/footer injection fields identified in inspected admin | Gap: layout-level exclusion on every admin route and preview |
| Credential/session model | Router checks role/UI gate/live hook; Phoenix `SECRET_KEY_BASE` | Gap: migration or approved exception; preserve safeguards |
| Native operations | Authentication/reCAPTCHA, Email, General, Users | Inventory preserved in contract; runtime regressions untested |

Paths are repository-relative. Documentation alone passes no implementation requirement.

## Implementation sequence

1. Publish foundation and pin SHA. Resolve assets, domain, legal and admin-model decisions.
2. Add common schema/migration/storage adapter, retaining operational keys/reset precedence. Test persistence, atomic rollback and conflicts.
3. Add common landing form and shell, preserving native URLs, operations, role checks and live hooks.
4. Add public shell/metadata/legal/theme/injection behavior; keep booking/scheduling themes intact.
5. Run canonical checklist and relevant existing Calendar suites in isolation. Attach evidence; resolve standard ambiguities centrally.

## Acceptance evidence to fill after implementation

Record application SHA, standards SHA, environment, date and reviewer. Each case needs Pass / Fail / Not tested / Approved exception and evidence. No production release while mandatory cases fail or remain untested.

- Screenshots at 1440px, 768px and 360px in Light/Dark; keyboard focus, 200% zoom and no overflow.
- Automatic under both OS modes, live OS changes, refresh persistence/first paint; booking themes preserved.
- Navigation ordering/toggles/safe URLs, exact labels, access buttons with actual auth policy enforced.
- Atomic save, invalid values, blank/reset, restart persistence, cross-node refresh and concurrent conflict.
- PNG/SVG upload validation, icon/OG/hero preview failure states; initial favicon/meta/OG changes; protected monogram.
- Plain legal links, approved policy scope, reopening privacy settings and consent-controlled scripts.
- Harmless injection marker executes once publicly and never on `/admin`, nested/alias paths, admin sign-in/errors or previews; broken public code leaves admin recoverable.
- Wrong/missing credential, roles, expiry/logout/replay/rotation, CSRF/socket rejection, first-user bootstrap and SaaS gate.
- Existing Authentication, Email, General, Users, scheduling, calendar sync, video/payments, locales and booking customization regressions.

## Open decisions

Publication/pin; canonical CDN/font/monogram URLs; final Calendar domain/login/signup destinations; legal policy/Iubenda coverage; token-gate migration versus approved role exception. Do not resolve these by changing live infrastructure in this patch.
